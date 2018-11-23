//
//  TMTransition.h
//  转场动画
//
//  Created by 闫振 on 2018/11/23.
//  Copyright © 2018年 TeeMo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL isPush;

@end

NS_ASSUME_NONNULL_END
