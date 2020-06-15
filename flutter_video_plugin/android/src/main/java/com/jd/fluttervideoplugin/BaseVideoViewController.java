package com.jd.fluttervideoplugin;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import io.flutter.Log;

public class BaseVideoViewController {

    static Class<?> _videoViewClass;

    static void register(Class<?> videoViewClass) {
        _videoViewClass = videoViewClass;
    }

    static BaseVideoViewController alloc() {
        try {
            if (_videoViewClass == null) {
                _videoViewClass = BaseVideoViewController.class;
            }
            Class<?> video = _videoViewClass;
            return (BaseVideoViewController) video.newInstance();
        } catch (Exception e) {
            Log.e("videoView",
                    "Could not find videoViewClass.");
        }
        return  null;
    }


    public View getView(Context context, Map<String, Object> params) {
        TextView myNativeView = new TextView(context);
        myNativeView.setText("我是Android播放器");
        return myNativeView;
    }

    public void prepare() {
        System.out.println("prepare");
    }

    public void play() {
        System.out.println("play");
    }

    public void pause() {
        System.out.println("pause");
    }

    public void stop() {
        System.out.println("stop");
    }

    public  void resume() {
        System.out.println("resume");
    }

    public void replay() {
        System.out.println("replay");
    }

    public void mute() {
        System.out.println("mute");
    }

    public void unmute() {
        System.out.println("unmute");
    }

    public void seekTo(double position) {
        System.out.println("seekTo");
    }

    public String duration() {
        System.out.println("duration");
        return  null;
    }

    public void setRate(String rate) {
        System.out.println("setRate");
    }


}
