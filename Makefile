TARGET := iphone:clang:latest:7.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpoofBundleId

SpoofBundleId_FILES = Tweak.x
SpoofBundleId_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
