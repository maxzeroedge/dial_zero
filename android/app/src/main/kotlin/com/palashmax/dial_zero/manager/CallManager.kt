package com.palashmax.dial_zero.manager

import android.content.Intent
import android.net.Uri
import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.media.MediaRecorder
import android.os.Build
import android.os.Environment
import android.telecom.Call
import androidx.annotation.RequiresApi
import java.io.File
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.*

class CallManager(private val context: Context) {
    private var currentCall: Call? = null
    private val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private var isRecording = false
    private var mediaRecorder: MediaRecorder? = null

    data class AudioDeviceOption(
        val deviceInfo: AudioDeviceInfo,
        val name: String,
        val isOutput: Boolean
    )

    @RequiresApi(Build.VERSION_CODES.M)
    fun initiateCall(phoneNumber: String): Boolean {
        if (context.checkSelfPermission(android.Manifest.permission.CALL_PHONE) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
            return false
        }

        val uri = Uri.parse("tel:$phoneNumber")
        val callIntent = Intent(Intent.ACTION_CALL, uri)
        callIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(callIntent)
        return true
    }

    fun setCurrentCall(call: Call) {
        currentCall = call
    }

    @RequiresApi(Build.VERSION_CODES.M)
    fun getAvailableAudioDevices(): List<AudioDeviceOption> {
        // TODO: Must be one or more of: AudioManager.GET_DEVICES_INPUTS, AudioManager.GET_DEVICES_OUTPUTS
        val devices = audioManager.getDevices(AudioManager.GET_DEVICES_ALL)
        return devices.mapNotNull { device ->
            val isOutput = device.isSink
            val isInput = device.isSource
            when {
                !isOutput && !isInput -> null
                else -> AudioDeviceOption(
                    deviceInfo = device,
                    name = getReadableDeviceName(device),
                    isOutput = isOutput
                )
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun getReadableDeviceName(device: AudioDeviceInfo): String {
        return when (device.type) {
            AudioDeviceInfo.TYPE_BUILTIN_EARPIECE -> "Phone earpiece"
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER -> "Phone speaker"
            AudioDeviceInfo.TYPE_WIRED_HEADSET -> "Wired headset"
            AudioDeviceInfo.TYPE_WIRED_HEADPHONES -> "Wired headphones"
            AudioDeviceInfo.TYPE_LINE_ANALOG -> "Analog line-out"
            AudioDeviceInfo.TYPE_LINE_DIGITAL -> "Digital line-out"
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO -> "Bluetooth headset"
            AudioDeviceInfo.TYPE_BLUETOOTH_A2DP -> "Bluetooth A2DP"
            AudioDeviceInfo.TYPE_HDMI -> "HDMI"
            AudioDeviceInfo.TYPE_HDMI_ARC -> "HDMI ARC"
            AudioDeviceInfo.TYPE_USB_DEVICE -> "USB audio"
            AudioDeviceInfo.TYPE_USB_ACCESSORY -> "USB accessory audio"
            AudioDeviceInfo.TYPE_DOCK -> "Dock audio"
            AudioDeviceInfo.TYPE_FM -> "FM radio"
            AudioDeviceInfo.TYPE_BUILTIN_MIC -> "Phone microphone"
            AudioDeviceInfo.TYPE_FM_TUNER -> "FM tuner"
            AudioDeviceInfo.TYPE_TV_TUNER -> "TV tuner"
            AudioDeviceInfo.TYPE_TELEPHONY -> "Telephony"
            AudioDeviceInfo.TYPE_AUX_LINE -> "Auxiliary line-in"
            AudioDeviceInfo.TYPE_IP -> "IP audio"
            AudioDeviceInfo.TYPE_BUS -> "Audio bus"
            AudioDeviceInfo.TYPE_USB_HEADSET -> "USB headset"
            else -> "Unknown device"
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    fun changeAudioDevice(deviceOption: AudioDeviceOption) {
        //TODO: Unresolved reference: setPreferredDevice
        audioManager.setPreferredDevice(deviceOption.deviceInfo)
    }

    @RequiresApi(Build.VERSION_CODES.M)
    fun putCallOnHold() {
        currentCall?.let { call ->
            if (call.state == Call.STATE_ACTIVE) {
                call.hold()
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    fun addParticipantToCall(phoneNumber: String) {
        //TODO: Unresolved reference: createCallDetails
        currentCall?.conference(Call.Details.createCallDetails(context, phoneNumber))
    }

    @RequiresApi(Build.VERSION_CODES.S)
    fun toggleCallRecording() {
        if (!isRecording) {
            startCallRecording()
        } else {
            stopCallRecording()
        }
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private fun startCallRecording() {
        if (isRecording) return

        val audioSource = MediaRecorder.AudioSource.VOICE_COMMUNICATION
        val outputFormat = MediaRecorder.OutputFormat.AMR_NB
        val audioEncoder = MediaRecorder.AudioEncoder.AMR_NB

        val fileName = "Call_${SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())}.amr"
        val file = File(context.getExternalFilesDir(Environment.DIRECTORY_RECORDINGS), fileName)

        mediaRecorder = MediaRecorder().apply {
            setAudioSource(audioSource)
            setOutputFormat(outputFormat)
            setAudioEncoder(audioEncoder)
            setOutputFile(file.absolutePath)

            try {
                prepare()
                start()
                isRecording = true
            } catch (e: IOException) {
                e.printStackTrace()
                isRecording = false
            }
        }
    }

    private fun stopCallRecording() {
        if (!isRecording) return

        mediaRecorder?.apply {
            stop()
            release()
        }
        mediaRecorder = null
        isRecording = false
    }

    @RequiresApi(Build.VERSION_CODES.M)
    fun endCall() {
        if (isRecording) {
            stopCallRecording()
        }
        currentCall?.let { call ->
            call.disconnect()
        }
        currentCall = null
    }
}