package com.jd.fluttervideoplugin;

import android.content.Context;
import android.view.View;

import java.util.Map;

import androidx.annotation.NonNull;
import io.flutter.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;


public class VideoViewController implements PlatformView, MethodChannel.MethodCallHandler {

    private static final String NATIVE_CCTV_VIEW_TYPE_ID = "flutter_video_controller";
    private final BaseVideoViewController videoView;
    private Context context;
    private Map<String, Object> params;

    VideoViewController(Context context, BinaryMessenger messenger, int id, Map<String, Object> params) {
        this.context = context;
        this.params = params;
        BaseVideoViewController view = BaseVideoViewController.alloc();
        this.videoView = view;
        //注册消息通道
        MethodChannel methodChannel = new MethodChannel(messenger, NATIVE_CCTV_VIEW_TYPE_ID+"_" + id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return this.videoView.getView(this.context,this.params);
    }

    @Override
    public void dispose() {

    }

    @Override
    public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
        String method = methodCall.method;
        if ("prepare".equals(method)) {
            this.videoView.prepare();
            result.success(null);
        } else if ("play".equals(method)) {
            this.videoView.play();
            result.success(null);
        } else if ("pause".equals(method)) {
            this.videoView.pause();
            result.success(null);
        } else if ("stop".equals(method)) {
            this.videoView.stop();
            result.success(null);
        } else if ("resume".equals(method)) {
            this.videoView.resume();
            result.success(null);
        } else if ("replay".equals(method)) {
            this.videoView.replay();
            result.success(null);
        } else if ("mute".equals(method)) {
            this.videoView.mute();
            result.success(null);
        } else if ("unmute".equals(method)) {
            this.videoView.unmute();
            result.success(null);
        } else if ("seekTo".equals(method)) {
            double text = (double) methodCall.arguments;
            this.videoView.seekTo(text);
            result.success(null);
        } else if ("duration".equals(method)) {
            String duration = this.videoView.duration();
            result.success(duration);
        } else if ("setRate".equals(method)) {
            String text = (String) methodCall.arguments;
            this.videoView.setRate(text);
            result.success(null);
        }
    }
}