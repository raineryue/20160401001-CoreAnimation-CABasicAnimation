//
//  ViewController.m
//  20160401001-CoreAnimation-CABasicAnimation
//
//  Created by Rainer on 16/4/1.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

/**
 *  控制器视图加载完成
 *  核心动画只能加在Layer层
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.创建一个CALayer对象
    self.layer = [[CALayer alloc] init];
    
    // 2.设置对象的属性
    self.layer.position = CGPointMake(160, 200);
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    
    // 3.将对象添加到控制器视图图层上
    [self.view.layer addSublayer:self.layer];
}

/**
 *  触摸事件开始
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self layerBasicAnimation];
    
    [self imageViewBasicAnimation];
}

/**
 *  UIImageView的动画
 */
- (void)imageViewBasicAnimation {
    // 1.创建一个basic核定动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    
    // 2.设置动画的属性
    basicAnimation.keyPath = @"transform.scale";
    basicAnimation.toValue = @0.5;
    basicAnimation.repeatCount = MAXFLOAT;
    
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    
    // 3.将动画添加到图片视图的layer层
    [self.imageView.layer addAnimation:basicAnimation forKey:nil];
}

/**
 *  纯layer的动画
 */
- (void)layerBasicAnimation {
    // 1.创建一个basic核心动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    
    // 2.设置动画的属性
    // 2.1.设置动画的属性key
    basicAnimation.keyPath = @"position";
    // 2.2.设置动画的属性Path
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(120, 500)];
    // 2.3.设置动画的时长
    basicAnimation.duration = 0.5;
    
    // 2.4.设置动画不反弹回去
    basicAnimation.removedOnCompletion = NO;
    // 2.5.设置动画保持最新状态
    basicAnimation.fillMode = kCAFillModeForwards;
    
    // 1.将动画添加到图层上
    [self.layer addAnimation:basicAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
