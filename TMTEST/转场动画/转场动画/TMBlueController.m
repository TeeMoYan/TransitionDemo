//
//  TMBlueController.m
//  转场动画
//
//  Created by 闫振 on 2018/11/23.
//  Copyright © 2018年 TeeMo. All rights reserved.
//

#import "TMBlueController.h"
#import "TMTransition.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


@interface TMBlueController ()<UINavigationControllerDelegate>


@end

@implementation TMBlueController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];

    [self drawCircle];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}
- (void)drawCircle{
    

    //贝塞尔曲线 画一个带有圆角的矩形
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) cornerRadius:0];
    //贝塞尔曲线 画一个圆形
    [bpath appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(80, SCREEN_HEIGHT -80) radius:50 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    //创建一个CAShapeLayer 图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bpath.CGPath;
    
    //添加图层蒙板
    
    UIButton *btn =[UIButton buttonWithType:(UIButtonTypeCustom)];
    _mBlueBtn = btn;
    _mBlueBtn.backgroundColor = [UIColor whiteColor];
    _mBlueBtn.layer.cornerRadius = 50;
    [self.view addSubview:btn];
    btn.frame = CGRectMake(30, SCREEN_HEIGHT -130, 100, 100);
    [btn addTarget:self action:@selector(btnClcik:) forControlEvents:(UIControlEventTouchUpInside)];
    
}
- (void)btnClcik:(UIButton *)btn{
   
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        TMTransition *trans = [TMTransition new];
        trans.isPush = NO;
        return trans;
    }else{
        return nil;
    }
}
@end
