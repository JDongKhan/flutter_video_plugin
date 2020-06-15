package com.jd.fluttervideoplugin;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;
import io.flutter.plugin.common.PluginRegistry;

/** FluttervideopluginPlugin */
public class FluttervideopluginPlugin implements FlutterPlugin {

  public static String NATIVE_CCTV_VIEW_TYPE_ID = "plugins.flutter_video_plugin";//原生控件对应的viewtypeid

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final String key = FluttervideopluginPlugin.class.getCanonicalName();
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterPluginBinding.getFlutterEngine());

    if (shimPluginRegistry.hasPlugin(key)){
      return;
    }

    PluginRegistry.Registrar registrar = shimPluginRegistry.registrarFor(key);
    registrar.platformViewRegistry().registerViewFactory(NATIVE_CCTV_VIEW_TYPE_ID, new VideoViewFactory(registrar.messenger()));

  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {

  }

}
