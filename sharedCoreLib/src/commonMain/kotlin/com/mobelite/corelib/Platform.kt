package com.mobelite.corelib

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform