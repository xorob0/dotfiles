#!/usr/bin/env python3

# Copyright 2017 Chris Braun (cryzed) <cryzed@googlemail.com>
#
# This file is part of qutebrowser.
#
# qutebrowser is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# qutebrowser is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with qutebrowser.  If not, see <http://www.gnu.org/licenses/>.

"""
Insert login information using pass and a dmenu-compatible application (e.g. dmenu, rofi -dmenu, ...). A short
demonstration can be seen here: https://i.imgur.com/KN3XuZP.gif.
"""

USAGE = """The domain of the site has to appear as a segment in the pass path, for example: "github.com/cryzed" or
"websites/github.com". How the username and password are determined is freely configurable using the CLI arguments. The
login information is inserted by emulating key events using qutebrowser's fake-key command in this manner:
[USERNAME]<Tab>[PASSWORD], which is compatible with almost all login forms."""

EPILOG = """Dependencies: tldextract (Python 3 module), pass.
For issues and feedback please use: https://github.com/cryzed/qutebrowser-userscripts.
WARNING: The login details are viewable as plaintext in qutebrowser's debug log (qute://log) and might be shared if
you decide to submit a crash report!"""

import argparse
import enum
import fnmatch
import functools
import os
import re
import shlex
import subprocess
import sys
from parse import *

import tldextract

argument_parser = argparse.ArgumentParser(description=__doc__, usage=USAGE, epilog=EPILOG)
argument_parser.add_argument('url', nargs='?', default=os.getenv('QUTE_URL'))
argument_parser.add_argument('--password-store', '-p', default=os.path.expanduser('~/.password-store'),
                             help='Path to your pass password-store')
argument_parser.add_argument('--username', '-u', default ='username',
                             help='Define default password, used if none exist in the pass file')
argument_parser.add_argument('--dmenu-invocation', '-d', default='dmenu',
                             help='Invocation used to execute a dmenu-provider')
argument_parser.add_argument('--no-insert-mode', '-n', dest='insert_mode', action='store_false',
                             help="Don't automatically enter insert mode")
argument_parser.add_argument('--io-encoding', '-i', default='UTF-8',
                             help='Encoding used to communicate with subprocesses')
argument_parser.add_argument('--merge-candidates', '-m', action='store_true',
                             help='Merge pass candidates for fully-qualified and registered domain name')
group = argument_parser.add_mutually_exclusive_group()
group.add_argument('--username-only', '-e', action='store_true', help='Only insert username')
group.add_argument('--password-only', '-w', action='store_true', help='Only insert password')

stderr = functools.partial(print, file=sys.stderr)


class ExitCodes(enum.IntEnum):
    SUCCESS = 0
    FAILURE = 1
    # 1 is automatically used if Python throws an exception
    NO_PASS_CANDIDATES = 2
    COULD_NOT_MATCH_USERNAME = 3
    COULD_NOT_MATCH_PASSWORD = 4


def qute_command(command):
    with open(os.environ['QUTE_FIFO'], 'w') as fifo:
        fifo.write(command + '\n')
        fifo.flush()


def find_pass_candidates(domain, password_store_path):
    candidates = []
    for path, directories, file_names in os.walk(password_store_path):
        for file_name in file_names:
            print(file_name)
            if domain in file_name:
                pass_path = path[len(password_store_path) + 1:]
                gpg = parse("{0}.gpg", pass_path + "/" + file_name)[0]
                candidates.append(gpg)

    return candidates


def pass_(path, encoding):
    process = subprocess.run(['pass', path], stdout=subprocess.PIPE)
    return process.stdout.decode(encoding).strip()


def dmenu(items, invocation, encoding):
    command = shlex.split(invocation)
    process = subprocess.run(command, input='\n'.join(items).encode(encoding), stdout=subprocess.PIPE)
    return process.stdout.decode(encoding).strip()


def fake_key_raw(text):
    for character in text:
        # Escape all characters by default, space requires special handling
        sequence = '" "' if character == ' ' else '\{}'.format(character)
        qute_command('fake-key {}'.format(sequence))


def main(arguments):
    if not arguments.url:
        argument_parser.print_help()
        return ExitCodes.FAILURE

    extract_result = tldextract.extract(arguments.url)

    # Expand potential ~ in paths, since this script won't be called from a shell that does it for us
    password_store_path = os.path.expanduser(arguments.password_store)

    # Try to find candidates using targets in the following order: fully-qualified domain name (includes subdomains),
    # the registered domain name and finally: the IPv4 address if that's what the URL represents
    candidates = set()
    for target in filter(None, [extract_result.fqdn, extract_result.registered_domain, extract_result.ipv4]):
        target_candidates = find_pass_candidates(target, password_store_path)
        if not target_candidates:
            continue

        candidates.update(target_candidates)
        if not arguments.merge_candidates:
            break
    else:
        if not candidates:
            stderr('No pass candidates for URL {!r} found!'.format(arguments.url))
            return ExitCodes.NO_PASS_CANDIDATES

    selection = candidates.pop() if len(candidates) == 1 else dmenu(sorted(candidates), arguments.dmenu_invocation,
                                                                    arguments.io_encoding)
    # Nothing was selected, simply return
    if not selection:
        return ExitCodes.SUCCESS

    secret = pass_(selection, arguments.io_encoding).splitlines()
    username = arguments.username
    password = secret[0]

    # Match username
    for line in secret:
        if re.match("^login: ", line) is not None:
            username = parse("login: {0}", line)[0]

    if arguments.username_only:
        fake_key_raw(username)
    elif arguments.password_only:
        fake_key_raw(password)
    else:
        # Enter username and password using fake-key and <Tab> (which seems to work almost universally), then switch
        # back into insert-mode, so the form can be directly submitted by hitting enter afterwards
        fake_key_raw(username)
        qute_command('fake-key <Tab>')
        fake_key_raw(password)

    if arguments.insert_mode:
        qute_command('enter-mode insert')

    return ExitCodes.SUCCESS


if __name__ == '__main__':
    arguments = argument_parser.parse_args()
    sys.exit(main(arguments))
