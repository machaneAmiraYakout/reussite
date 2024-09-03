package com.example.reussite1

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import android.view.WindowManager

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Set the FLAG_SECURE flag to prevent screenshots
        window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
    }
}
