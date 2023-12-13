package com.mobelite.corelib

import platform.UIKit.UIDevice

class IOSPlatform: DevicePlatform {
    override val model: String = UIDevice.currentDevice.model
    override val brand: String = "Apple"
}

actual fun getDevicePlatform(): DevicePlatform = IOSPlatform()