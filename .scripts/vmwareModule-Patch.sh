#!/bin/bash
cp -n /usr/lib/vmware/modules/source/vmmon.tar /usr/lib/vmware/modules/source/vmmon.tar_bak
cp /usr/lib/vmware/modules/source/vmmon.tar .
tar xf vmmon.tar
patch -p0 << "EOF"
--- vmmon-only/linux/hostif.c
+++ vmmon-only/linux/hostif.c
@@ -1162,7 +1162,9 @@
    int retval;

    down_read(&current->mm->mmap_sem);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0)
+   retval = get_user_pages((unsigned long)uvAddr, numPages, 0, ppages, NULL);
+#elif LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
    retval = get_user_pages((unsigned long)uvAddr, numPages, 0, 0, ppages, NULL);
 #else
    retval = get_user_pages(current, current->mm, (unsigned long)uvAddr,
EOF
tar cf /usr/lib/vmware/modules/source/vmmon.tar vmmon-only
rm -rf vmmon-only
rm -f vmmon.tar

cp -n /usr/lib/vmware/modules/source/vmnet.tar /usr/lib/vmware/modules/source/vmnet.tar_bak
cp /usr/lib/vmware/modules/source/vmnet.tar .
tar xf vmnet.tar
patch -p0 << "EOF"
--- vmnet-only/userif.c
+++ vmnet-only/userif.c
@@ -113,7 +113,9 @@
    int retval;

    down_read(&current->mm->mmap_sem);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0)
+   retval = get_user_pages(addr, 1, FOLL_WRITE, &page, NULL);
+#elif LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
    retval = get_user_pages(addr, 1, 1, 0, &page, NULL);
 #else
    retval = get_user_pages(current, current->mm, addr,
EOF
tar cf /usr/lib/vmware/modules/source/vmnet.tar vmnet-only
rm -rf vmnet-only
rm -f vmnet.tar
