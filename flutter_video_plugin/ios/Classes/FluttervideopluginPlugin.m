#import "FluttervideopluginPlugin.h"
#import "VideoViewFactory.h"

@implementation FluttervideopluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
   VideoViewFactory* factory = [[VideoViewFactory alloc] initWithMessenger:registrar.messenger];
   [registrar registerViewFactory:factory withId:@"plugins.flutter_video_plugin"];
}


@end
