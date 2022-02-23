package com.github.crayonxiaoxin.flutter_wan_android

import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.security.NetworkSecurityPolicy
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.*

class MainActivity : FlutterActivity() {
    private val methodChannel = "com.github.crayonxiaoxin/method_channel"
    private val eventChannel = "com.github.crayonxiaoxin/event_channel"

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
        // 只能回调一次
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            methodChannel
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "toast" -> showToast(call, result)
                "alert-dialog" -> showAlert(call, result)
                "use-http" -> result.success(isCleartextTrafficPermitted())
                else -> result.notImplemented()
            }
        }

        // 可以回调多次
        var eventJob: Job? = null
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannel)
            .setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    // 参数列表
                    val args = arguments as? ArrayList<*>
                    eventJob = CoroutineScope(Dispatchers.Main).launch {
                        for (i in 0 until 3) {
                            events?.success("event ${args?.get(0)} $i")
                            delay(2000)
                        }
                    }
                }

                override fun onCancel(arguments: Any?) {
                    eventJob?.cancel()
                }
            })
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
