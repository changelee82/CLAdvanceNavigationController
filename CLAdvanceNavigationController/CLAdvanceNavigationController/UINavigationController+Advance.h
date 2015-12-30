//
//  UINavigationController+Advance.h
//  CLAdvanceNavigationController
//
//  Created by 李辉 on 15/12/30.
//  Copyright © 2015年 李辉. All rights reserved.
//  https://github.com/changelee82/CLAdvanceNavigationController
//

#import <UIKit/UIKit.h>

/**  在页面切换时，拥有前进动画效果的导航控制器 */
@interface UINavigationController (Advance)

/** 拥有前进动画效果的push页面操作 */
- (void)pushAdvanceViewController:(nullable UIViewController *)viewController animated:(BOOL)animated;

/** 拥有前进动画效果的pop页面操作 */
- (nullable UIViewController *)popAdvanceViewControllerAnimated:(BOOL)animated;

/**  拥有前进动画效果的popToRoot页面操作 */
- (nullable NSArray<__kindof UIViewController *> *)popAdvanceToRootViewControllerAnimated:(BOOL)animated;

/** 拥有前进动画效果的popToViewController页面操作 */
- (nullable NSArray<__kindof UIViewController *> *)popAdvanceToViewController:(nullable UIViewController *)viewController animated:(BOOL)animated;

@end
