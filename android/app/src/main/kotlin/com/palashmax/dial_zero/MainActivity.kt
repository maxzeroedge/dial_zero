package com.palashmax.dial_zero

import android.content.Context
import android.os.BatteryManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        val dialerActions = DialerActions(
            batteryManager = batteryManager,
            applicationContext = applicationContext,
            flutterEngine = flutterEngine
        )
        dialerActions.registerChannelHandler()
    }
}
