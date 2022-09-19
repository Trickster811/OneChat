package com.example.one_chat

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.engine.flutterEngine
import androidx.annotation.NonNull;

  class MainActivity: FlutterFragmentActivity() {
      override fun configureFlutterEngine(@NonNull flutterEngine){
        GeneratedPluginRegistrant.registrantWith(flutterEngine)
      }
  }
