//
//  ViewController.m
//  testClock
//
//  Created by 王迎博 on 16/3/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "ViewController.h"
#import "YBCALayer.h"
#import "MyViewController.h"


//宏
#define YBCoder @"YB哈哈哈"
//变量
NSString *YBCoder1 = @"YB哈哈哈";
//常量
extern NSString *YBCoder2;
extern const NSString *YBCoder3;
static const NSString *YBCoder4 = @"YB哈哈哈";//局部常量：用static修饰后，不能提供外界访问
const NSString *YBCoder5 = @"YB哈哈哈";//全局常量：不管你定义在任何文件夹，外部都能访问
NSString const *YBCoder6 = @"YB哈哈哈";
NSString * const YBCoder7 = @"YB哈哈哈";//一般我们定义一个常量又不想被修改应该这样


@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //测试CALayer动画  教程：http://www.cnblogs.com/wendingding/p/3800736.html
    [self testCALyer];
    
    //进阶CALayer动画
    [self addCustomCALayer];
    
    //第二种方式:使用代理
    [self addLayer];
    
    //添加右上角按钮
    [self addButton];
}


/**
 *  测试CALayer动画
 */
- (void)testCALyer
{
    //创建图层
    CALayer *myLayer = [CALayer layer];
    
    //设置图层属性
    myLayer.backgroundColor = [UIColor greenColor].CGColor;
    myLayer.bounds = CGRectMake(0, 0, 150, 100);
    
    //用来设置CALayer在父层中的位置,以父层的左上角为原点(0, 0)
    myLayer.position = CGPointMake(100, 100);
    //称为“定位点”、“锚点”，决定着CALayer身上的哪个点会在position属性所指的位置，以自己的左上角为原点(0, 0)，它的x、y取值范围都是0~1，默认值为（0.5, 0.5）
    myLayer.anchorPoint = CGPointZero;
    myLayer.cornerRadius = 10;
    
    //添加图层
    [self.view.layer addSublayer:myLayer];
    _layer = myLayer;
}


/**
 *  进阶CALayer动画
 */
- (void)addCustomCALayer
{
    //1.创建自定义的layer
     YBCALayer *myLayer=[YBCALayer layer];
     //2.设置layer的属性
     myLayer.backgroundColor=[UIColor brownColor].CGColor;
     myLayer.bounds=CGRectMake(0, 0, 200, 150);
     myLayer.anchorPoint=CGPointZero;
     myLayer.position=CGPointMake(100, 250);
     myLayer.cornerRadius=20;
     myLayer.shadowColor=[UIColor blackColor].CGColor;
     myLayer.shadowOffset=CGSizeMake(10, 20);
     myLayer.shadowOpacity=0.6;

     [myLayer setNeedsDisplay];
     //3.添加layer
     [self.view.layer addSublayer:myLayer];
}


/**
 *  第二种方式:使用代理
 */
- (void)addLayer
{
    //1.创建自定义的layer
    CALayer *layer=[CALayer layer];
    //2.设置layer的属性
    layer.backgroundColor=[UIColor brownColor].CGColor;
    layer.bounds=CGRectMake(0, 0, 200, 150);
    layer.anchorPoint=CGPointZero;
    layer.position=CGPointMake(100, 450);
    layer.cornerRadius=20;
    layer.shadowColor=[UIColor blackColor].CGColor;
    layer.shadowOffset=CGSizeMake(10, 20);
    layer.shadowOpacity=0.6;

    //设置代理
    layer.delegate=self;
    [layer setNeedsDisplay];
    //3.添加layer
    [self.view.layer addSublayer:layer];
}


/**
 *  第二种方式-代理方法
 */
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //1.绘制图形
    //画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    //设置属性（颜色）
    [[UIColor yellowColor]set];
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 0.5);

    //2.渲染
    CGContextFillPath(ctx);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{//如何查看CALayer的某个属性是否支持隐式动画？可以查看头文件，看有没有Animatable，如果有则表示支持。
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction commit];
    
    //隐式动画
    if (self.layer.bounds.size.width == 200.0) {
        self.layer.backgroundColor = [UIColor greenColor].CGColor;
        self.layer.bounds = CGRectMake(0, 0, 150, 100);
    }else
    {
        self.layer.bounds = CGRectMake(0, 0, 200, 60);
        self.layer.backgroundColor = [UIColor yellowColor].CGColor;
    }
}



/**
 *  添加右上角按钮
 */
- (void)addButton
{
    UIButton *buildButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [buildButton setTitle:@"下一页" forState:UIControlStateNormal];
    buildButton.frame = CGRectMake(0,0, 80, 30);
    [buildButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [buildButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buildButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buildButton];
    self.navigationItem.rightBarButtonItem = buildButtonItem;
}
- (void)cancelClick:(UIButton *)sender
{
    MyViewController *vc = [[MyViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
