################################################################################
#
# flutter-pi
#
#################################################################################

FLUTTER_PI_VERSION = 821a5c6a222e5ac05471ee7610b64e745e63bc4d
FLUTTER_PI_SITE = $(call github,ardera,flutter-pi,$(FLUTTER_PI_VERSION))

FLUTTER_PI_LICENSE = MIT
FLUTTER_PI_LICENSE_FILES = LICENSE

FLUTTER_PI_CONF_OPTS = -DUSER_PROJECT_PATH=examples/flutter-drm-gbm-backend

FLUTTER_PI_DEPENDENCIES = libinput libxkbcommon xkeyboard-config

$(eval $(cmake-package))
