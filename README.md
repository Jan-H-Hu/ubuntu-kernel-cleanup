# ubuntu-kernel-cleanup
Bash script for cleaning up unused kernels.

This is especially useful if you use a small boot partition.

It's useful to me, use at your own risk.

Tested with:
- ubuntu 14.04 (Trusty Tahr)
- ubuntu 16.04 (Xenial Xerus)

probably works fine with other releases.

<pre>
$ ./kernel-cleanup.sh 
current kernel release 3.13.0-79-generic
PROPOSED FOR REMOVAL:
linux-headers-3.13.0-77 linux-headers-3.13.0-77-generic linux-image-3.13.0-77-generic linux-image-extra-3.13.0-77-generic
Are you sure? [y/N] y
...
</pre>

