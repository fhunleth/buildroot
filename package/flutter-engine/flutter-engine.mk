GN_TARGET_OS = "linux"
GN_TARGET_ARCH = "arm64"

GN_ARGS = "--target-sysroot ${STAGING_DIR_TARGET}${PACKAGECONFIG_CONFARGS}"
GN_ARGS_append = " --target-os ${GN_TARGET_OS}"
GN_ARGS_append = " --linux-cpu ${GN_TARGET_ARCH}"
GN_ARGS_append = " --arm-float-abi hard"
GN_ARGS_append = " --embedder-for-target"
GN_ARGS_append = " --disable-desktop-embeddings"
FLUTTER_ENGINE_SITE=
FLUTTER_ENGINE_SOURCE=
FLUTTER_ENGINE_VERSION=da768751d43b1f287bf99bea703ea13e2eedcf4d

FLUTTER_ENGINE_CONFIGURE_CMDS=
		export DEPOT_TOOLS_UPDATE=0
    export PATH=${S}:${S}/${GN_TOOLS_PYTHON2_PATH}:$PATH

    cd ${WORKDIR}
    echo 'solutions = [
        {
            "managed" : False,
            "name" : "src/flutter",
            "url" : "https://github.com/flutter/engine.git@${ENGINE_VERSION}",
            "custom_deps": {},
            "deps_file": "DEPS",
            "safesync_url": "",
            "custom_vars": {
                "download_android_deps": False,
                "download_windows_deps": False,
            },
        },
    ]' > .gclient
    gclient sync
		
    cd ${WORKDIR}/src
    ./flutter/tools/gn ${GN_ARGS}

FLUTTER_ENGINE_COMPILE_CMDS=
		export PATH=${S}:${S}/${GN_TOOLS_PYTHON2_PATH}:$PATH

    cd ${WORKDIR}/src
    ninja -C ${ARTIFACT_DIR}

FLUTTER_ENGINE_INSTALL_CMDS=
    install -d ${D}${libdir}
    install -m 0755 ${WORKDIR}/src/${ARTIFACT_DIR}/libflutter_engine.so ${D}${libdir}