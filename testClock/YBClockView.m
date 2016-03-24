//
//  YBClockView.m
//  testClock
//
//  Created by 王迎博 on 16/3/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "YBClockView.h"

#define kAngleToRadion(angle) ((angle) / 180.0 * M_PI)

@interface YBClockView ()
{
    __weak NSTimer *_timer;
}
@property (nonatomic, strong) CALayer *hourLayer;
@property (nonatomic, strong) CALayer *minuteLayer;
@property (nonatomic, strong) CALayer *secondLayer;

@end

@implementation YBClockView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    if (self = [super initWithFrame:frame])
    {
        UIImage *image = [UIImage imageNamed:imageName];
        self.layer.contents = (__bridge id _Nullable)(image.CGImage);
       
        CGFloat selfWidth = self.frame.size.width;
        //设置时针
        self.hourLayer = [self layerWithBackgroundColor:[UIColor blackColor] size:CGSizeMake(3, selfWidth/2 - 40)];
        //设置分针
        self.minuteLayer = [self layerWithBackgroundColor:[UIColor blackColor] size:CGSizeMake(3, selfWidth/2 - 20)];
        //设置秒针
        self.secondLayer = [self layerWithBackgroundColor:[UIColor redColor] size:CGSizeMake(1, selfWidth/2 - 20)];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeUpdate:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
        _timer = timer;
        
        [self updateUI];
    }
    return self;
}


- (void)releaseTimer
{
    [_timer invalidate];
    _timer = nil;
}



#pragma mark - Private
- (void)timeUpdate:(NSTimer *)timer
{
    [self updateUI];
}


- (void)updateUI
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *date = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    
    NSInteger second = date.second;
    NSInteger minute = date.minute;
    NSInteger hour = date.hour;
    
    CGFloat perHourMove = 360.0 / 12.0;
    CGFloat hourAngle = hour * perHourMove + minute * (1/60) *perHourMove;
    self.hourLayer.transform = CATransform3DMakeRotation(kAngleToRadion(hourAngle), 0, 0, 1);
    
    // 一分钟就是一圈，也就是每秒走度
    CGFloat minuteAngle = minute * 360.0 / 60.0;
    self.minuteLayer.transform = CATransform3DMakeRotation(kAngleToRadion(minuteAngle), 0, 0, 1);
    
    CGFloat secondAngle = second * 360.0 / 60.0;
    self.secondLayer.transform = CATransform3DMakeRotation(kAngleToRadion(secondAngle), 0, 0, 1);
}

- (CALayer *)layerWithBackgroundColor:(UIColor *)color size:(CGSize)size
{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = color.CGColor;
    layer.anchorPoint = CGPointMake(0.5, 0.9);
    
    //设置position，为中心
    layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    //时针、分针和秒针的长度
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    layer.cornerRadius = 4;
    
    [self.layer addSublayer:layer];
    
    return layer;
}

- (void)dealloc
{
    NSLog(@"销毁计时器钟表页面");
    [_timer invalidate];
}


@end
