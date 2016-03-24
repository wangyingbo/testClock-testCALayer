//
//  YBClockView.h
//  testClock
//
//  Created by 王迎博 on 16/3/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBClockView : UIView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;

- (void)releaseTimer;


@end
