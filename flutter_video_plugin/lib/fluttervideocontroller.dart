import 'package:flutter/services.dart';

class PlatformDemoViewController {
  MethodChannel _channel;
  PlatformDemoViewController.init(int id) {
    _channel = new MethodChannel('flutter_video_controller_$id');
  }

  Future<void> prepare() async {
    return _channel.invokeMethod('prepare');
  }

  Future<void> play() {
    return _channel.invokeMethod('play');
  }

  Future<void> pause() {
    return _channel.invokeMethod('pause');
  }

  Future<void> stop() {
    return _channel.invokeMethod('stop');
  }

  Future<void> resume() {
    return _channel.invokeMethod('resume');
  }

  Future<void> replay() {
    return _channel.invokeMethod('replay');
  }

  Future<void> mute() {
    return _channel.invokeMethod('mute');
  }

  Future<void> unmute() {
    return _channel.invokeMethod('unmute');
  }

  Future<void> seekTo(double position) {
    return _channel.invokeMethod('seekTo');
  }

  Future<String> duration() {
    return _channel.invokeMethod('duration');
  }

  Future<void> setRate(String rate) {
    return _channel.invokeMethod('setRate');
  }

}