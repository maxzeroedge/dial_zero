package com.palashmax.dial_zero

import android.content.Context
import android.media.AudioManager
import android.os.BatteryManager
import android.os.Build
import android.telecom.TelecomManager
import androidx.annotation.RequiresApi
import com.palashmax.dial_zero.action.BatteryActions
import com.palashmax.dial_zero.action.DialerActions
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

@RequiresApi(Build.VERSION_CODES.M)
class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        val batteryActions = BatteryActions(
            batteryManager = batteryManager,
            applicationContext = applicationContext,
            flutterEngine = flutterEngine
        )
        batteryActions.registerChannelHandler()
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        val telecomManager = getSystemService(Context.TELECOM_SERVICE) as TelecomManager
        val dialerActions = DialerActions(
            telecomManager = telecomManager,
            audioManager = audioManager,
            applicationContext = applicationContext,
            flutterEngine = flutterEngine
        )
        dialerActions.registerChannelHandler()
    }
}
