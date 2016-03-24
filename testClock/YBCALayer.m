//
//  YBCALayer.m
//  testClock
//
//  Created by 王迎博 on 16/3/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "YBCALayer.h"

@implementation YBCALayer

//重写该方法，在该方法内绘制图形
-(void)drawInContext:(CGContextRef)ctx
 {
     //1.绘制图形
     //画一个圆
     CGContextAddEllipseInRect(ctx, CGRectMake(50, 25, 100, 100));
     //设置属性（颜色）
     //[[UIColor yellowColor]set];
     CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);

    //2.渲染
    CGContextFillPath(ctx);
}
@end
