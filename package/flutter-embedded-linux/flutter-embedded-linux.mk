################################################################################
#
# flutter-embedded-linux
#
#################################################################################

FLUTTER_EMBEDDED_LINUX_VERSION = 9dec787a64077ba99a229bad0adbb69c52ee874e
FLUTTER_EMBEDDED_LINUX_SITE = $(call github,sony,flutter-embedded-linux,$(FLUTTER_EMBEDDED_LINUX_VERSION))

FLUTTER_EMBEDDED_LINUX_LICENSE = BSD-3-Clause
FLUTTER_EMBEDDED_LINUX_LICENSE_FILES = LICENSE

FLUTTER_EMBEDDED_LINUX_CONF_OPTS = -DUSER_PROJECT_PATH=examples/flutter-drm-gbm-backend

$(eval $(cmake-package))