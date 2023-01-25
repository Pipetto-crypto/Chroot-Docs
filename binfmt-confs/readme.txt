Put these in /usr/share/binfmts, make sure you have binfmt-support package installed in your chroot.

For binfmt you will need to recompile your kernel with CONFIG_BINFMT_MISC enabled in your device kernel's defconfig.(It's not very hard since there are plenty of guides on xda on how to compile a phone kernel)
