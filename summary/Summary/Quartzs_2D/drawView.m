//
//  drawView.m
//  summary
//
//  Created by NewBoy on 2018/3/23.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "drawView.h"

@implementation drawView

/*
 1.UIImage对象直接draw      drawInRect
 2.label有文本直接draw      drawTextInRect
 */
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

//    CGPoint points[] = {
//        CGPointMake(10, 10),
//        CGPointMake(20, 30),
//        CGPointMake(34, 50),
//        CGPointMake(10, 10),
//    };
//
    //利用路径进行画图
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    //作用：既保护了图形上下文状态的唯一性,也方便了在需要的地方修改图形上下状态
//    CGContextSaveGState(context);
//    //创建路径
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor); // 线框的颜色
//     CGPathMoveToPoint(path, NULL, 70, 100);
//    CGPathAddLineToPoint(path, NULL,80, 200);
//    CGPathAddLineToPoint(path, NULL, 300, 80);
//
//    CGContextAddPath(context, path);
//    CGContextStrokePath(context);
//    CGContextRestoreGState(context);
//
//    CGPathRelease(path);
//
//
//    //画一yuan
//    CGMutablePathRef path1 = CGPathCreateMutable();
////    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor); // 线框的颜色
//    CGPathAddEllipseInRect(path1, NULL, CGRectMake(300, 300, 100, 100));
//
//    //把要绘制的图形信息添加到上下文中
//    CGContextAddPath(context,path1);
//
//    //渲染
//    CGContextStrokePath(context);
//    CGPathRelease(path1);


    [self drawWithContext];

//
//         //1.获取图形上下文
//         CGContextRef ctx=UIGraphicsGetCurrentContext();
//
//         //2.绘图
//        //2.1创建一条直线绘图的路径
//        //注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
//         CGMutablePathRef path=CGPathCreateMutable();
//         //2.2把绘图信息添加到路径里
//        CGPathMoveToPoint(path, NULL, 70, 100);
//         CGPathAddLineToPoint(path, NULL,80, 200);
//    CGPathAddLineToPoint(path, NULL, 300, 80);
//         //2.3把路径添加到上下文中
//         //把绘制直线的绘图信息保存到图形上下文中
//         CGContextAddPath(ctx, path);
//
//         //3.渲染
//         CGContextStrokePath(ctx);
//
//         //4.释放前面创建的两条路径
//         //第一种方法
//         CGPathRelease(path);


}

- (void)drawWithContext{
    //1.用图形上下文绘制
    //获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();

    //属性赋值
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor); // 线框的颜色
//    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor); //填充的颜色（比如一个三角形内部填充）
    CGContextSetLineCap(context, kCGLineCapButt);
    CGContextSetLineWidth(context, 0.5);

    CGPoint lines[] = {
        CGPointMake(0, 93.562857142857141),
        CGPointMake(68.599999999999994, 113.78714285714285),
        CGPointMake(137.19999999999999, 23.697142857142865),
        CGPointMake(205.79999999999998, 135.84999999999999),
        CGPointMake(274.39999999999998, 7.1500000000000057),
    };

    //要画的点
//    CGContextMoveToPoint(context, 70, 100);
//    CGContextAddLineToPoint(context, 80, 200);
//    CGContextAddLineToPoint(context, 300, 80);
//    CGContextAddLineToPoint(context, 320, 100);
//    CGContextAddLineToPoint(context, 400, 200);
//    CGContextAddLineToPoint(context, 500, 80);

    //    CGContextClosePath(context);

    CGContextAddLines(context, lines, sizeof(lines)/ sizeof(lines[0]));

    //绘制
        CGContextStrokePath(context); //画线专用方法
//    CGContextDrawPath(context, kCGPathFillStroke);

//    CGContextFillPath(context); //画填充图形专用方法
}


//UIImage对象直接画
- (void)drawRectWithImageObj{
    UIImage *iamge = [UIImage imageNamed:@"22.jpeg"];
    [iamge drawInRect:self.bounds];
}

//label有文本直接draw
- (void)drawRectWithLableObj{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 20)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"这是画上去的";
    label.font = [UIFont systemFontOfSize:9];
    [label drawTextInRect:label.frame];
}

@end
