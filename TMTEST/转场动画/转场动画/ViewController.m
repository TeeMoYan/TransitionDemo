//
//  ViewController.m
//  转场动画
//
//  Created by 闫振 on 2018/11/23.
//  Copyright © 2018年 TeeMo. All rights reserved.
//

#import "ViewController.h"
#import "TMBlueController.h"
#import "TMTransition.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
    
    UIButton *btn =[UIButton buttonWithType:(UIButtonTypeCustom)];
    _mFirstBtn = btn;
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 50;

    btn.frame = CGRectMake(30, SCREEN_HEIGHT -130, 100, 100);
    [btn addTarget:self action:@selector(btnClcik:) forControlEvents:(UIControlEventTouchUpInside)];
}
- (void)btnClcik:(UIButton *)btn{
    TMBlueController *blue_vc = [[TMBlueController alloc] init];
    [self.navigationController pushViewController:blue_vc animated:YES];
}


#pragma mark - UINavigationControllerDelegate
//就是告诉nav，我不需要自带的转场动画了，我想自定义转场动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        TMTransition *trans = [TMTransition new];
        trans.isPush = YES;
        return trans;
    }else{
        return nil;
    }
}
@end
