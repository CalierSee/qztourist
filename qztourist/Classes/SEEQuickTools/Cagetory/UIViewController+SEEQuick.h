//
//  UIViewController+SEEQuick.h
//  美团外卖
//
//  Created by 景彦铭 on 2016/10/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SEEQuick)

/**
 添加子控制器

 @param vc   子控制器
 @param view 添加到的视图
 */
- (void)addSubViewController:(UIViewController *)vc view:(UIView *)view;

@end
