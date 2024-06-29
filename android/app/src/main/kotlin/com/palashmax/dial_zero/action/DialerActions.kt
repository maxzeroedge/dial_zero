package com.palashmax.dial_zero.action

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// Building based on: https://developer.android.com/develop/connectivity/telecom/selfManaged

@RequiresApi(Build.VERSION_CODES.M)
class DialerActions(
    private val audioManager: AudioManager,
    val applicationContext: Context,
    private val flutterEngine: FlutterEngine
) {
    private val channelName = "com.palashmax.dial_zero/dialer_actions"

    fun registerChannelHandler() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler {
                call, result ->
            if (call.method == "getAudioSources") {
                result.success(getAudioSources())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getAudioSources(): List<Map<String, Any>> {
        val audioDevices: Array<AudioDeviceInfo> = audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)
        print(audioDevices)
        return audioDevices.map {
            mapOf(
                "id" to it.id,
                "type" to it.type,
                "productName" to it.productName,
                "name" to it.productName
            )
        }
    }


}