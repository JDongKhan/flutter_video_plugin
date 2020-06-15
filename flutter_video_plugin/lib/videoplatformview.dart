import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'fluttervideocontroller.dart';

const String viewTypeString = 'plugins.flutter_video_plugin';
typedef void VideoPlatformViewCreatedCallback(PlatformDemoViewController controller);

class VideoPlatformView extends StatefulWidget {

  VideoPlatformView({
    Key key,
    this.onCreated,
  });

  final VideoPlatformViewCreatedCallback onCreated;

  @override
  _VideoPlatformViewState createState() => _VideoPlatformViewState();
}

class _VideoPlatformViewState extends State<VideoPlatformView> {
  PlatformDemoViewController _controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: _nativeView(),
      onTapDown: (TapDownDetails details) {
        print("onTapDown: ${details.globalPosition}");
      },
    );
  }

  Widget _nativeView() {
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: viewTypeString,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: viewTypeString,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onCreated == null) {
      return;
    }
    _controller = PlatformDemoViewController.init(id);
    widget.onCreated(_controller);
  }
}