package com.example.websearch
import android.annotation.SuppressLint
import android.app.ActivityManager
import io.flutter.embedding.android.FlutterActivity
import android.content.Context
import android.os.Build
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "app.channel.shared.data"


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "clearData") {
                clearAppData()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    @SuppressLint("ServiceCast")
    private fun clearAppData() {
        val context: Context = applicationContext
        if (Build.VERSION_CODES.KITKAT <= Build.VERSION.SDK_INT) {
            (context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager)?.clearApplicationUserData()
        }
    }

}
