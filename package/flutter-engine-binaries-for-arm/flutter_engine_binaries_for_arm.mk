################################################################################
#
# flutter-engine-binaries-for-arm
#
#################################################################################

# Flutter 2.8.1 (stable channel)
FLUTTER_ENGINE_BINARIES_FOR_ARM_VERSION = 599798d2d3e7e8ac529b7aad42f2569569084797
FLUTTER_ENGINE_BINARIES_FOR_ARM_SITE = $(call github,ardera,flutter-engine-binaries-for-arm,$(FLUTTER_ENGINE_BINARIES_FOR_ARM_VERSION))
FLUTTER_ENGINE_BINARIES_FOR_ARM_INSTALL_STAGING = YES

FLUTTER_ENGINE_BINARIES_FOR_ARM_LICENSE = BSD-3-Clause
FLUTTER_ENGINE_BINARIES_FOR_ARM_LICENSE_FILES = LICENSE

define FLUTTER_ENGINE_BINARIES_FOR_ARM_BUILD_CMDS
	echo "Using Flutter engine binary"
endef

define FLUTTER_ENGINE_BINARIES_FOR_ARM_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/arm64/libflutter_engine.so.release $(STAGING_DIR)/usr/lib/libflutter_engine.so
	$(INSTALL) -D -m 0755 $(@D)/arm64/icudtl.dat $(STAGING_DIR)/usr/lib/icudtl.dat
	$(INSTALL) -D -m 0755 $(@D)/flutter_embedder.h  $(STAGING_DIR)/usr/include
endef

define FLUTTER_ENGINE_BINARIES_FOR_ARM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/arm64/libflutter_engine.so.release $(TARGET_DIR)/usr/lib/libflutter_engine.so
	$(INSTALL) -D -m 0755 $(@D)/arm64/icudtl.dat $(TARGET_DIR)/usr/lib/icudtl.dat
endef

$(eval $(generic-package))