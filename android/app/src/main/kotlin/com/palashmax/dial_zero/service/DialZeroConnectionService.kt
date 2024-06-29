package com.palashmax.dial_zero.service

import android.os.Build
import android.telecom.Connection
import android.telecom.ConnectionRequest
import android.telecom.ConnectionService
import android.telecom.PhoneAccountHandle
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.M)
class DialZeroConnectionService: ConnectionService() {


    /**
     * https://developer.android.com/reference/android/telecom/ConnectionService#onCreateOutgoingConnection(android.telecom.PhoneAccountHandle,%20android.telecom.ConnectionRequest)
     */
    override fun onCreateOutgoingConnection(phoneAccountHandle: PhoneAccountHandle, connectionRequest: ConnectionRequest): Connection? {
        TODO("Unimplemented")
    }

    /**
     * https://developer.android.com/reference/android/telecom/ConnectionService#onCreateOutgoingConnectionFailed(android.telecom.PhoneAccountHandle,%20android.telecom.ConnectionRequest)
     */
    override fun onCreateOutgoingConnectionFailed(phoneAccountHandle: PhoneAccountHandle, connectionRequest: ConnectionRequest) {
        TODO("Unimplemented")
    }

    /**
     * https://developer.android.com/reference/android/telecom/ConnectionService#onCreateIncomingConnection(android.telecom.PhoneAccountHandle,%20android.telecom.ConnectionRequest)
     */
    override fun onCreateIncomingConnection(phoneAccountHandle: PhoneAccountHandle, connectionRequest: ConnectionRequest): Connection? {
        TODO("Unimplemented")
    }

    /**
     * https://developer.android.com/reference/android/telecom/ConnectionService#onCreateIncomingConnectionFailed(android.telecom.PhoneAccountHandle,%20android.telecom.ConnectionRequest)
     */
    override fun onCreateIncomingConnectionFailed(phoneAccountHandle: PhoneAccountHandle, connectionRequest: ConnectionRequest) {
        TODO("Unimplemented")
    }
}