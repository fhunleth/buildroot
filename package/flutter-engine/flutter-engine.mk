################################################################################
#
# flutter-engine
#
#################################################################################

# Flutter 2.8.1 (stable channel)
FLUTTER_ENGINE_VERSION = 890a5fca2e34db413be624fc83aeea8e61d42ce6
FLUTTER_ENGINE_SITE = $(call github,flutter,engine,$(FLUTTER_ENGINE_VERSION))
FLUTTER_ENGINE_DEPENDENCIES = host-ninja host-python3
FLUTTER_ENGINE_INSTALL_STAGING = YES

FLUTTER_ENGINE_LICENSE = BSD-3-Clause
FLUTTER_ENGINE_LICENSE_FILES = LICENSE


GN_TARGET_OS = "linux"
GN_TARGET_ARCH = "arm64"

GN_ARGS = "--target-sysroot ${STAGING_DIR_TARGET}${PACKAGECONFIG_CONFARGS}"
GN_ARGS_append = " --target-os ${GN_TARGET_OS}"
GN_ARGS_append = " --linux-cpu ${GN_TARGET_ARCH}"
GN_ARGS_append = " --arm-float-abi hard"
GN_ARGS_append = " --embedder-for-target"
GN_ARGS_append = " --disable-desktop-embeddings"

FLUTTER_ENGINE_DOWNLOAD_CMDS = \
	echo "HELLO!!!!!"; \
	echo 'solutions = [ \
	    { \
	        "managed" : False, \
	        "name" : "src/flutter", \
	        "url" : "https://github.com/flutter/engine.git@$(FLUTTER_ENGINE_VERSION)", \
	        "custom_deps": {}, \
	        "deps_file": "DEPS", \
	        "safesync_url": "", \
	        "custom_vars": { \
	            "download_android_deps": False, \
	            "download_windows_deps": False, \
	        }, \
	    }, \
	]' > $(D)/.gclient;

FLUTTER_ENGINE_CONFIGURE_CMDS = \
	exit 1; \
	export DEPOT_TOOLS_UPDATE=0; \
	export PATH=${S}:${S}/${GN_TOOLS_PYTHON2_PATH}:$(PATH); \
	\
	cd ${WORKDIR}; \
	echo 'solutions = [ \
	    { \
	        "managed" : False, \
	        "name" : "src/flutter", \
	        "url" : "https://github.com/flutter/engine.git@${ENGINE_VERSION}", \
	        "custom_deps": {}, \
	        "deps_file": "DEPS", \
	        "safesync_url": "", \
	        "custom_vars": { \
	            "download_android_deps": False, \
	            "download_windows_deps": False, \
	        }, \
	    }, \
	]' > $(D)/.gclient; \
	gclient sync; \
	\
	cd ${WORKDIR}/src; \
	./flutter/tools/gn ${GN_ARGS}

FLUTTER_ENGINE_COMPILE_CMDS = \
	export PATH=${S}:${S}/${GN_TOOLS_PYTHON2_PATH}:$PATH; \
	cd ${WORKDIR}/src; \
	$(NINJA) -C ${ARTIFACT_DIR}

FLUTTER_ENGINE_INSTALL_CMDS = \
	install -d ${D}${libdir}; \
	install -m 0755 ${WORKDIR}/src/${ARTIFACT_DIR}/libflutter_engine.so ${D}${libdir}

$(eval $(generic-package))

