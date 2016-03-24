//
//  MyViewController.m
//  testClock
//
//  Created by 王迎博 on 16/3/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "MyViewController.h"
#import "YBView.h"
#import "YBClockView.h"
#import "YBAnimationClock.h"


@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //测试CALayer
    [self addLayer];
    
    //用定时器做钟表
    [self addTimerClock];
    
    //用动画做钟表
    [self addAnimationClock];
}


/**
 *  测试CALayer
 */
- (void)addLayer
{
    YBView *view = [[YBView alloc]initWithFrame:CGRectMake(50, 50, 200, 150)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
}


/**
 *  用定时器做钟表
 */
- (void)addTimerClock
{
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 200) / 2;
    YBClockView *clockView = [[YBClockView alloc]initWithFrame:CGRectMake(x, 220, 200, 200)                                            imageName:@"钟表"];
    [self.view addSubview:clockView];
}


/**
 *  用动画做钟表
 */
- (void)addAnimationClock
{
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 250) / 2;
        YBAnimationClock *aniClockView = [[YBAnimationClock alloc] initWithFrame:CGRectMake(x, 425, 200, 200)
        imageName:@"钟表"];
        [self.view addSubview:aniClockView];
}
@end
