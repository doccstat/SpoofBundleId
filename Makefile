# Minimum build target is iOS 15.0
TARGET := iphone:clang:latest:15.0

THEOS_PACKAGE_SCHEME=rootless

# The name of the process to kill upon install, the name of the app
INSTALL_TARGET_PROCESSES = EXECUTABLE_NAME

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpoofBundleId

SpoofBundleId_FILES = Tweak.x
SpoofBundleId_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
