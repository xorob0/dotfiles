#   qute://help/configuring.html
#   qute://help/settings.html

path = str(config.configdir)

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Force a Qt platform to use. This sets the `QT_QPA_PLATFORM`
# environment variable and is useful to force using the XCB plugin when
# running QtWebEngine on Wayland.
# Type: String
c.qt.force_platform = 'xcb'

# Store cookies. Note this option needs a restart with QtWebEngine on Qt
# < 5.9.
# Type: Bool
c.content.cookies.store = True

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'utf-8'


# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Enable JavaScript.
# Type: Bool
c.content.javascript.enabled = False

# Openning list of domain where javascript is allowed
domainlist = open(path + "/jsAllow.txt", "r")
# Creating a array from the file
domains = domainlist.read().split('\n')
# Deleting last element as it is empty (and thus, allow javascript anywhere)
del domains[-1]

# Enable javascript on the allowed domains
for domain in domains:
    config.set('content.javascript.enabled', True, '*.' + domain)
domainlist.close()

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '40%'

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = True

# Width (in pixels) of the scrollbar in the completion window.
# Type: Int
c.completion.scrollbar.width = 12

# Execute the best-matching command on a partial match.
# Type: Bool
c.completion.use_best_match = True

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 10000

# Mode to use for hints.
# Type: String
# Valid values:
#   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
#   - letter: Use the characters in the `hints.chars` setting.
#   - word: Use hints words based on the html elements and the extra words.
c.hints.mode = 'number'

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Hide the statusbar unless a message is shown.
# Type: Bool
c.statusbar.hide = True

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Switch between tabs using the mouse wheel.
# Type: Bool
c.tabs.mousewheel_switching = True

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'right'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'switching'

# Duration (in milliseconds) to show the tab bar before hiding it when
# tabs.show is set to 'switching'.
# Type: Int
c.tabs.show_switching_delay = 1000

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = '10%'

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://qwant.com'

# Open base URL of the searchengine if a searchengine shortcut is
# invoked without parameters.
# Type: Bool
c.url.open_base_url = True

# Window title format
c.window.title_format = '{title}{title_sep}{current_url}'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict

with open(path + "/searchengines.txt", "r") as f :
    for line in f:
       (alias, url) = line.split()
       c.url.searchengines[str(alias)] = url

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://qwant.com'

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = True

# Load colorscheme
with open(str(config.datadir) + '/userscripts/colorscheme.py') as f :
    exec(f.read())

# Bindings for normal mode
config.bind(',d', 'spawn youtube-dl -o ~/Videos/%(title)s.%(ext)s {url}')
config.bind(',m', 'spawn umpv {url}')
config.bind(';d', 'hint links spawn youtube-dl -o ~/Videos/%(title)s.%(ext)s {hint-url}')
config.bind(';m', 'hint links spawn umpv {hint-url}')
config.bind('E', 'spawn --userscript qutepass.py -Y')
config.bind('e', 'spawn --userscript qutepass.py --username xorob0')
config.bind('gi', 'jseval -q -f ' + str(config.datadir) +'/userscripts/cycle-inputs.js')
config.bind('aa', 'spawn --userscript jsAllow.py -a')
config.bind('au', 'spawn --userscript jsAllow.py -u')
