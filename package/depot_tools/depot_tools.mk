################################################################################
#
# depot_tools
#
################################################################################

DEPOT_TOOLS_VERSION = da768751d43b1f287bf99bea703ea13e2eedcf4d
DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools.git
DEPOT_TOOLS_SITE_METHOD = git
DEPOT_TOOLS_INSTALL_TARGET = NO
DEPOT_TOOLS_LICENSE = BSD-3-Clause
DEPOT_TOOLS_LICENSE_FILES = LICENSE
DEPOT_TOOLS_DEPENDENCIES = host-python3

define HOST_DEPOT_TOOLS_INSTALL_CMDS
	$(INSTALL) -m 0755 -D $(@D)/gclient $(HOST_DIR)/bin/gclient
	$(INSTALL) -m 0755 -D $(@D)/gclient.py $(HOST_DIR)/bin/gclient.py
endef

$(eval $(host-generic-package))
