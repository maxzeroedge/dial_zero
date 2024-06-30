package com.palashmax.dial_zero.action

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.net.Uri
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import android.telecom.TelecomManager
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// Building based on: https://developer.android.com/develop/connectivity/telecom/selfManaged

@RequiresApi(Build.VERSION_CODES.M)
class DialerActions(
    private val telecomManager: TelecomManager,
    private val audioManager: AudioManager,
    val applicationContext: Context,
    private val flutterEngine: FlutterEngine
) {
    private val channelName = "com.palashmax.dial_zero/dialer_actions"

    fun registerChannelHandler() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler {
                call, result ->
            when(call.method) {
                "getAudioSources" -> result.success(getAudioSources())
                "makeTheCall" -> result.success(makeTheCall(call.arguments.toString()))
                else -> result.notImplemented()
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
        }.toList()
    }

    private fun makeTheCall(number: String) {
        if (ActivityCompat.checkSelfPermission(
                applicationContext,
                Manifest.permission.CALL_PHONE
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return
        }
        val uri = Uri.fromParts("tel", number, null)
        val extras = Bundle()
        extras.putBoolean(TelecomManager.EXTRA_START_CALL_WITH_SPEAKERPHONE, true)
        telecomManager.placeCall(uri, extras)
    }


}