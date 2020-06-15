#import "VideoViewController.h"
#import "BaseVideoViewController.h"

@interface VideoViewController ()

@property(nonatomic, strong) BaseVideoViewController *videoView;
@property(nonatomic) int64_t viewId;
@property(nonatomic, strong) FlutterMethodChannel *channel;

@property(nonatomic, strong) NSDictionary *params;

@end

@implementation VideoViewController

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        self.params = args;
        self.videoView = [BaseVideoViewController newInstance];
        //注册消息通道
        self.viewId = viewId;
        NSString *channelName = [NSString stringWithFormat:@"flutter_video_controller_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [self.channel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];
    }

    return self;
}

- (UIView *)view {
    return [self.videoView getView:self.params];
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    
    NSString *method = call.method;
    
    if ([@"prepare" isEqualToString:method]) {
        [self.videoView prepare];
        result(nil);
    } else if ([@"play" isEqualToString:method]) {
        [self.videoView play];
        result(nil);
    } else if ([@"pause" isEqualToString:method]) {
        [self.videoView pause];
        result(nil);
    } else if ([@"stop" isEqualToString:method]) {
        [self.videoView stop];
        result(nil);
    } else if ([@"resume" isEqualToString:method]) {
        [self.videoView resume];
        result(nil);
    } else if ([@"replay" isEqualToString:method]) {
        [self.videoView replay];
        result(nil);
    } else if ([@"mute" isEqualToString:method]) {
        [self.videoView mute];
        result(nil);
    } else if ([@"unmute" isEqualToString:method]) {
        [self.videoView unmute];
        result(nil);
    } else if ([@"seekTo" isEqualToString:method]) {
        NSString *text = call.arguments;
        [self.videoView seekTo:text.doubleValue];
        result(nil);
    } else if ([@"duration" isEqualToString:method]) {
         NSString *duration = [self.videoView duration];
        result(duration);
    } else if ([@"setRate" isEqualToString:method]) {
        NSString *rate = call.arguments;
        [self.videoView setRate:rate];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
