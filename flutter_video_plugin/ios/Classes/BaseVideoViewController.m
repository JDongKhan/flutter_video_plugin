#import "BaseVideoViewController.h"

static Class _videoViewClass;

@interface BaseVideoViewController ()

@end

@implementation BaseVideoViewController

+ (void)register:(Class)videoViewClass {
    _videoViewClass = videoViewClass;
}

+ (instancetype)newInstance {
    if (_videoViewClass == nil) {
        _videoViewClass = BaseVideoViewController.class;
    }
    return [[_videoViewClass alloc] init];
}

- (UIView *)getView:(NSDictionary *)params {
    UITextView *myNativeView =  [[UITextView alloc] init];
    [myNativeView setText:@"我是iOS播放器"];
    return myNativeView;
}

- (void)prepare {
    NSLog(@"prepare");
}

- (void)play {
    NSLog(@"play");
}

- (void)pause {
    NSLog(@"pause");
}

- (void)stop {
    NSLog(@"stop");
}

- (void)resume {
   NSLog(@"resume");
}

- (void)replay {
   NSLog(@"replay");
}

- (void)mute {
   NSLog(@"mute");
}

- (void)unmute {
   NSLog(@"unmute");
}

- (void)seekTo:(double)position {
   NSLog(@"seekTo");
}

- (NSString *)duration {
   NSLog(@"duration");
   return @"10";
}

- (void)setRate:(NSString *)rate {
    NSLog(@"setRate");
}


@end
