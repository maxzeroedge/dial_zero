package com.palashmax.dial_zero.action

import android.content.Context
import android.media.AudioManager
import android.os.Build
import android.telecom.TelecomManager
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import com.google.gson.Gson
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.palashmax.dial_zero.manager.CallManager
import io.flutter.embedding.engine.FlutterEngine

class CallerAction(
    private val flutterEngine: FlutterEngine,
    private val callManager: CallManager
) {
    private val channelName = "com.palashmax.dial_zero/caller_actions"

    @RequiresApi(Build.VERSION_CODES.S)
    fun registerChannelHandler() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "initiateCall" -> {
                    val phoneNumber = call.argument<String>("phoneNumber")
                    if (phoneNumber != null) {
                        val success = callManager.initiateCall(phoneNumber)
                        result.success(success)
                    } else {
                        result.error("MISSING_PARAM", "Missing 'phoneNumber' parameter", null)
                    }
                }
                "getAvailableAudioDevices" -> {
                    val audioDeviceType = call.argument<String>("audioDeviceType") ?: ""
                    if(audioDeviceType.isEmpty()) {
                        result.error("INVALID_AUDIO_DEVICE_TYPE", "Invalid device type", null)
                        return@setMethodCallHandler
                    }
                    val devices = callManager.getAvailableAudioDevices(audioDeviceType)
                    val gson = Gson()
                    result.success(devices.map { gson.fromJson(gson.toJson(it), Map::class.java) })
                }
                "changeAudioDevice" -> {
                    val index = call.argument<Int>("index") ?: -1
                    val audioDeviceType = call.argument<String>("audioDeviceType") ?: ""
                    if(audioDeviceType.isEmpty()) {
                        result.error("INVALID_AUDIO_DEVICE_TYPE", "Invalid device type", null)
                        return@setMethodCallHandler
                    }
                    if (index >= 0) {
                        val devices = callManager.getAvailableAudioDevices(audioDeviceType)
                        if (index < devices.size) {
                            callManager.changeAudioDevice(devices[index])
                            result.success(true)
                        } else {
                            result.error("INVALID_INDEX", "Invalid device index", null)
                        }
                    } else {
                        result.error("MISSING_PARAM", "Missing 'index' parameter", null)
                    }
                }
                "toggleCallRecording" -> {
                    callManager.toggleCallRecording()
                    result.success(null)
                }
                "endCall" -> {
                    callManager.endCall()
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

    }
}