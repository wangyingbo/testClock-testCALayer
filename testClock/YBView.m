//
//  YBView.m
//  testClock
//
//  Created by 王迎博 on 16/3/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "YBView.h"

@implementation YBView


- (void)drawRect:(CGRect)rect
{
    //1.获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.绘制图形
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 25, 100, 100));
    //设置属性（颜色）
    //    [[UIColor yellowColor]set];
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);

    //3.渲染
    CGContextFillPath(ctx);
    
    //在执行渲染操作的时候，本质上它的内部相当于调用了下面的方法
//    [self.layer drawInContext:ctx];
}


@end
