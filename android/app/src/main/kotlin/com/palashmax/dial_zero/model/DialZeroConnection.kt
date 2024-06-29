package com.palashmax.dial_zero.model

import android.os.Build
import android.telecom.CallAudioState
import android.telecom.Connection
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.M)
class DialZeroConnection: Connection() {

    /**
     * https://developer.android.com/reference/android/telecom/Connection#onShowIncomingCallUi()
     */
    override fun onShowIncomingCallUi() {
        TODO()
    }

    /**
     * https://developer.android.com/reference/android/telecom/Connection#onCallAudioStateChanged(android.telecom.CallAudioState)
     */
    override fun onCallAudioStateChanged(callAudioState: CallAudioState) {
        TODO()
    }

    /**
     * https://developer.android.com/reference/android/telecom/Connection#onHold()
     */
    override fun onHold() {
        TODO()
    }

    /**
     * https://developer.android.com/reference/android/telecom/Connection#onUnhold()
     */
    override fun onUnhold() {
        TODO()
    }

    /**
     * https://developer.android.com/reference/android/telecom/Connection#onAnswer()
     */
    override fun onAnswer() {
        TODO()
    }

    /**
     * https://developer.android.com/reference/android/telecom/Connection#onReject()
     */
    override fun onReject() {
        TODO()
    }

    /**
     * https://developer.android.com/reference/android/telecom/Connection#onDisconnect()
     */
    override fun onDisconnect() {
        TODO()
    }
}