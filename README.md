# flutter_video_plugin

目前只是一个demo，待完善

这是一款万能的flutter播放器插件.

万能在哪呢？


可以适配任何播放器SDK。

dart提供标准的api以及原生也定义一套标准的实现，如果需要自定义则调用下面方法

```
BaseVideoViewController.register(Class<T extends BaseVideoViewController> clazz);
```

自己实现BaseVideoViewController来完善播放器基本能力。


