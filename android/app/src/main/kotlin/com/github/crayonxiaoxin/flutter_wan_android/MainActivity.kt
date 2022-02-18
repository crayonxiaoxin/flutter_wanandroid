package com.github.crayonxiaoxin.flutter_wan_android

import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.security.NetworkSecurityPolicy
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.github.crayonxiaoxin/flutter_wan_android"

    override fun onCreate(savedInstanceState: Bundle?) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.statusBarColor = Color.TRANSPARENT
        }
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        callAndroid(flutterEngine)
    }

    // Flutter 调用 Android 原生方法
    private fun callAndroid(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "toast" -> showToast(call, result)
                "alert-dialog" -> showAlert(call, result)
                "use-http" -> result.success(isCleartextTrafficPermitted())
                else -> result.notImplemented()
            }
        }
    }

    private fun isCleartextTrafficPermitted(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            return NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted
        }
        return true
    }

    private fun showAlert(call: MethodCall, result: MethodChannel.Result) {
        AlertDialog.Builder(context)
            .setTitle("${call.argument<String>("message")}")
            .setPositiveButton("OK") { dialog, _ ->
                dialog.dismiss()
            }.show()
        result.success(true)
    }

    private fun showToast(call: MethodCall, result: MethodChannel.Result) {
        Toast.makeText(context, "${call.argument<String>("message")}", Toast.LENGTH_SHORT)
            .show()
        result.success(true)
    }
}
