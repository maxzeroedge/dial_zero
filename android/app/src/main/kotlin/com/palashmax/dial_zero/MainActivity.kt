package com.palashmax.dial_zero

import android.content.Context
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.RequiresApi
import com.palashmax.dial_zero.action.BatteryActions
import com.palashmax.dial_zero.action.CallerAction
import com.palashmax.dial_zero.manager.CallManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

@RequiresApi(Build.VERSION_CODES.S)
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
        val callManager = CallManager(applicationContext)
        val callerAction = CallerAction(
            callManager = callManager,
            flutterEngine = flutterEngine
        )
        callerAction.registerChannelHandler()
    }
}
