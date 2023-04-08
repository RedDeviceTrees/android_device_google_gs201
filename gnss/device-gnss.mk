PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
	device/google/gs201/gnss/47765/config/gps.cer:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/gps.cer \
	device/google/gs201/gnss/47765/firmware/SensorHub.patch:$(TARGET_COPY_OUT_VENDOR)/firmware/SensorHub.patch

ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
	PRODUCT_COPY_FILES += \
		device/google/gs201/gnss/47765/config/lhd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/lhd.conf \
		device/google/gs201/gnss/47765/config/scd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/scd.conf
else
	PRODUCT_COPY_FILES += \
		device/google/gs201/gnss/47765/config/lhd_user.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/lhd.conf \
		device/google/gs201/gnss/47765/config/scd_user.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/scd.conf
endif

PRODUCT_SOONG_NAMESPACES += \
	device/google/gs201/gnss/47765

PRODUCT_PACKAGES += \
	android.hardware.gnss@2.1-impl-google \
	gps.default \
	flp.default \
	gpsd \
	lhd \
	scd \
	android.hardware.gnss@2.1-service-brcm

ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES_DEBUG += \
	init.gps_log.rc
endif
