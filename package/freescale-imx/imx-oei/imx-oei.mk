################################################################################
#
# imx-oei
#
################################################################################

IMX_OEI_VERSION = lf-6.12.3-1.0.0
IMX_OEI_SITE =  $(call github,nxp-imx,imx-oei,$(IMX_OEI_VERSION))
IMX_OEI_LICENSE = BSD-3
IMX_OEI_LICENSE_FILES = LICENSE.txt
IMX_OEI_INSTALL_IMAGES = YES

IMX_OEI_DEPENDENCIES = \
        $(BR2_MAKE_HOST_DEPENDENCY) \
        host-arm-gnu-toolchain

IMX_OEI_MAKE_ENV = \
	OEI_CROSS_COMPILE="$(HOST_DIR)/bin/arm-none-eabi-" \
	board=mx95lp5 \
	oei=ddr \
	DEBUG=1

define IMX_OEI_BUILD_CMDS
	$(IMX_OEI_MAKE_ENV) $(MAKE1) -C $(@D)
endef

#
# DDR firmware
#

define IMX_OEI_INSTALL_IMAGE_DDR_FW
	cp $(@D)/build/mx95lp5/ddr/oei-m33-ddr.bin \
		$(BINARIES_DIR)/oei-m33-ddr.bin
endef

define IMX_OEI_INSTALL_IMAGES_CMDS
	$(IMX_OEI_INSTALL_IMAGE_DDR_FW)
endef

$(eval $(generic-package))
