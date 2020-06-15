#import <UIKit/UIKit.h>

@interface BaseVideoViewController : NSObject

+ (void)register:(Class)videoViewClass;

+ (instancetype)newInstance;

- (UIView *)getView:(NSDictionary *)params;

- (void)prepare;

- (void)play;

- (void)pause;

- (void)stop;

- (void)resume;

- (void)replay;

- (void)mute;

- (void)unmute;

- (void)seekTo:(double)position;

- (NSString *)duration;

- (void)setRate:(NSString *)rate;


@end
