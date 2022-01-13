setenv fdt_high ffffffff

setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait usb-storage.quirks=0x2537:0x1066:u,0x2537:0x1068:u sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_fb_mem_reserve=16 cma=128M

fatload mmc 0 $kernel_addr_r zImage
fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-one.dtb

bootz $kernel_addr_r - $fdt_addr_r
