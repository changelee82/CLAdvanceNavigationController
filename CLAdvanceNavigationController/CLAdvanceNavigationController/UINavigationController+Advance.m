//
//  UINavigationController+Advance.m
//  CLAdvanceNavigationController
//
//  Created by 李辉 on 15/12/30.
//  Copyright © 2015年 李辉. All rights reserved.
//  https://github.com/changelee82/CLAdvanceNavigationController
//

#import "UINavigationController+Advance.h"

/**  动画持续时长 */
static const CGFloat kAnimationDuration = 0.5f;

/**  背景图片tag */
static const NSInteger kBackgroundViewTag = 10028;




@implementation UINavigationController (Advance)

/**  拥有前进动画效果的push页面操作 */
- (void)pushAdvanceViewController:(nullable UIViewController *)viewController animated:(BOOL)animated
{
    if (animated == NO)
    {
        [self pushViewController:viewController animated:NO];
        return;
    }
    
    if (self.viewControllers.count > 0)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        UIImageView *sourceImageView = [self.class screenshot];
        [self pushViewController:viewController animated:NO];
        UIImageView *destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        UIView *backgroundView = [[UIView alloc] initWithFrame:sourceImageView.bounds];
        backgroundView.backgroundColor = [UIColor blackColor];
        backgroundView.tag = kBackgroundViewTag;
        [self.view addSubview:backgroundView];
        
        // 添加跳转后视图截图到背景，并初始化
        destinationImageView.layer.opacity = 0.5;
        destinationImageView.layer.transform = [self backTransform3D];
        [backgroundView addSubview:destinationImageView];
        
        // 添加跳转前视图截图到背景，并初始化状态
        sourceImageView.layer.opacity = 1.0;
        sourceImageView.layer.transform = [self centerTransform3D];
        [backgroundView addSubview:sourceImageView];
        
        // 执行动画
        [sourceImageView.layer addAnimation:[self viewMoveFront] forKey:nil];
        [destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
    }
    else
    {
        [self pushViewController:viewController animated:YES];
    }
}

/**  拥有前进动画效果的pop页面操作 */
- (nullable UIViewController *)popAdvanceViewControllerAnimated:(BOOL)animated
{
    if (animated == NO)
    {
        return [self popViewControllerAnimated:NO];
    }
    
    if (self.viewControllers.count > 1)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        UIImageView *sourceImageView = [self.class screenshot];
        UIViewController *result = [self popViewControllerAnimated:NO];
        UIImageView *destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        UIView *backgroundView = [[UIView alloc] initWithFrame:sourceImageView.bounds];
        backgroundView.backgroundColor = [UIColor blackColor];
        backgroundView.tag = kBackgroundViewTag;
        [self.view addSubview:backgroundView];
        
        // 添加跳转前视图截图到背景
        sourceImageView.layer.opacity = 1.0;
        sourceImageView.layer.transform = [self centerTransform3D];
        [backgroundView addSubview:sourceImageView];
        
        // 添加跳转后视图截图到背景
        destinationImageView.layer.opacity = 0.0;
        destinationImageView.layer.transform = [self frontTransform3D];
        [backgroundView addSubview:destinationImageView];
        
        // 执行动画
        [sourceImageView.layer addAnimation:[self viewMoveBack] forKey:nil];
        [destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
        
        return result;
    }
    else
    {
        return [self popViewControllerAnimated:YES];
    }
}

/**  拥有前进动画效果的popToRoot页面操作 */
- (nullable NSArray<__kindof UIViewController *> *)popAdvanceToRootViewControllerAnimated:(BOOL)animated;
{
    if (animated == NO)
    {
        return [self popToRootViewControllerAnimated:NO];
    }
    
    if (self.viewControllers.count > 1)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        UIImageView *sourceImageView = [self.class screenshot];
        NSArray *result = [self popToRootViewControllerAnimated:NO];
        UIImageView *destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        UIView *backgroundView = [[UIView alloc] initWithFrame:sourceImageView.bounds];
        backgroundView.backgroundColor = [UIColor blackColor];
        backgroundView.tag = kBackgroundViewTag;
        [self.view addSubview:backgroundView];
        
        // 添加跳转前视图截图到背景
        sourceImageView.layer.opacity = 1.0;
        sourceImageView.layer.transform = [self centerTransform3D];
        [backgroundView addSubview:sourceImageView];
        
        // 添加跳转后视图截图到背景
        destinationImageView.layer.opacity = 0.0;
        destinationImageView.layer.transform = [self frontTransform3D];
        [backgroundView addSubview:destinationImageView];
        
        // 执行动画
        [sourceImageView.layer addAnimation:[self viewMoveBack] forKey:nil];
        [destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
        
        return result;
    }
    else
    {
        return [self popToRootViewControllerAnimated:YES];
    }
}

/** 拥有前进动画效果的popToViewController页面操作 */
- (nullable NSArray<__kindof UIViewController *> *)popAdvanceToViewController:(nullable UIViewController *)viewController animated:(BOOL)animated
{
    if (animated == NO)
    {
        return [self popToViewController:viewController animated:NO];
    }
    
    if (self.viewControllers.count > 1)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        UIImageView *sourceImageView = [self.class screenshot];
        NSArray *result = [self popToViewController:viewController animated:NO];
        UIImageView *destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        UIView *backgroundView = [[UIView alloc] initWithFrame:sourceImageView.bounds];
        backgroundView.backgroundColor = [UIColor blackColor];
        backgroundView.tag = kBackgroundViewTag;
        [self.view addSubview:backgroundView];
        
        // 添加跳转前视图截图到背景
        sourceImageView.layer.opacity = 1.0;
        sourceImageView.layer.transform = [self centerTransform3D];
        [backgroundView addSubview:sourceImageView];
        
        // 添加跳转后视图截图到背景
        destinationImageView.layer.opacity = 0.0;
        destinationImageView.layer.transform = [self frontTransform3D];
        [backgroundView addSubview:destinationImageView];
        
        // 执行动画
        [sourceImageView.layer addAnimation:[self viewMoveBack] forKey:nil];
        [destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
        
        return result;
    }
    else
    {
        return [self popToViewController:viewController animated:YES];
    }
}

#pragma mark - 动画

/** 被移动到后面的视图的transform */
- (CATransform3D)backTransform3D
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0 / -900;    // 透视效果，近大远小
    t = CATransform3DScale(t, 0.20, 0.20, 1);
    t = CATransform3DRotate(t, 15.0f * M_PI/180.0f, 1, 0, 0);
    return t;
}

/** 被移动到中间的视图的transform */
- (CATransform3D)centerTransform3D
{
    return CATransform3DIdentity;
}

/** 被移动到前面的视图的transform */
- (CATransform3D)frontTransform3D
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0 / 900;    // 透视效果，近大远小
    t = CATransform3DScale(t, 3.50, 3.50, 1);
    t = CATransform3DRotate(t, -15.0f * M_PI/180.0f, 1, 0, 0);
    return t;
}

/** 视图移动到后面的动画 */
- (CAAnimationGroup *)viewMoveBack
{
    // 移动到后方
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:[self backTransform3D]];
    animation.duration = kAnimationDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // 变为透明
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.toValue = [NSNumber numberWithFloat:0.5];    // 后面是图半透明
    animation2.duration = kAnimationDuration;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    [animation2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // 组成动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setDuration:animation.duration];
    [group setAnimations:[NSArray arrayWithObjects:animation, animation2, nil]];
    
    return group;
}

/** 视图移动到中间的动画 */
- (CAAnimationGroup *)viewMoveCenter
{
    // 移动到原来的位置
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:[self centerTransform3D]];
    animation.duration = kAnimationDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // 变为不透明
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.toValue = [NSNumber numberWithFloat:1.0];    // 中间视图不透明
    animation2.duration = kAnimationDuration;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    [animation2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // 组成动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setDuration:kAnimationDuration];
    [group setAnimations:[NSArray arrayWithObjects:animation, animation2, nil]];
    
    return group;
}

/** 视图移动到前面的动画 */
- (CAAnimationGroup *)viewMoveFront
{
    // 移动到前方
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:[self frontTransform3D]];
    animation.duration = kAnimationDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // 变为透明
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.toValue = [NSNumber numberWithFloat:0.0];    // 前方视图完全透明
    animation2.duration = kAnimationDuration;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    [animation2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // 组成动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setDuration:animation.duration];
    [group setAnimations:[NSArray arrayWithObjects:animation, animation2, nil]];
    
    return group;
}

/** 动画结束的委托事件 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSArray *subviews = [self.view subviews];
    for (UIView *view in subviews)
    {
        if(view.tag == kBackgroundViewTag)
        {
            [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [view removeFromSuperview];
        }
        
    }
    

}


#pragma mark - 私有方法

/** 获取当前屏幕截图，此代码来自Apple官方文档 */
+ (UIImageView *)screenshot
{
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Iterate over every window from back to front
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
        {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            // Offset by the portion of the bounds left of and above the anchor point
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            
            // Restore the context
            CGContextRestoreGState(context);
        }
    }
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView* screenshot = [[UIImageView alloc] initWithImage:image];
    screenshot.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    return screenshot;
}

@end
