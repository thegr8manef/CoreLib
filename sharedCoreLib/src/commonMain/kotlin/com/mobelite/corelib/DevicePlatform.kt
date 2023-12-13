package com.mobelite.corelib

interface DevicePlatform {
    val model: String
    val brand: String
}

expect fun getDevicePlatform(): DevicePlatform