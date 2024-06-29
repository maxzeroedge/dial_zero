package com.palashmax.dial_zero.action

import android.content.Context
import android.os.BatteryManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// Building based on: https://developer.android.com/develop/connectivity/telecom/selfManaged

class DialerActions(
    val applicationContext: Context,
    private val flutterEngine: FlutterEngine
) {
    private val channelName = "com.palashmax.dial_zero/dialer_actions"

    fun registerChannelHandler() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler {
                call, result ->
            if (call.method == "getAudioSources") {
                TODO()
            } else {
                result.notImplemented()
            }
        }
    }

    fun getAudioSources(): List<Any> {
        // TODO:
        return listOf()
    }


}