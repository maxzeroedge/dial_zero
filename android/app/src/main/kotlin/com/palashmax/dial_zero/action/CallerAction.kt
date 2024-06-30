package com.palashmax.dial_zero.action

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.palashmax.dial_zero.manager.CallManager

class CallerAction: FlutterPlugin, MethodCallHandler {
    private lateinit var channel : MethodChannel
    private lateinit var context: Context
    private lateinit var callManager: CallManager

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.palashmax.dial_zero/caller_actions")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        callManager = CallManager(context)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
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
                val devices = callManager.getAvailableAudioDevices()
                val deviceList = devices.map { 
                    mapOf(
                        "name" to it.name,
                        "isOutput" to it.isOutput
                    )
                }
                result.success(deviceList)
            }
            "changeAudioDevice" -> {
                val index = call.argument<Int>("index") ?: -1
                if (index >= 0) {
                    val devices = callManager.getAvailableAudioDevices()
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

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}