package com.palashmax.dial_zero

import android.content.Context
import android.os.BatteryManager
import com.palashmax.dial_zero.action.BatteryActions
import com.palashmax.dial_zero.action.DialerActions
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

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
        val dialerActions = DialerActions(
            applicationContext = applicationContext,
            flutterEngine = flutterEngine
        )
        dialerActions.registerChannelHandler()
    }
}
