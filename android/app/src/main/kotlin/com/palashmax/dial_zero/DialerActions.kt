package com.palashmax.dial_zero

import android.content.Context
import android.os.BatteryManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// Building based on: https://developer.android.com/develop/connectivity/telecom/selfManaged

class DialerActions(
    val batteryManager: BatteryManager,
    val applicationContext: Context,
    val flutterEngine: FlutterEngine
) {
    private val CHANNEL = "com.palashmax.dial_zero/dialer_actions"

    fun registerChannelHandler() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getAudioSources") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        return batteryLevel
    }

    fun getAudioSources(): List<Any> {
        // TODO:
        return listOf()
    }


}