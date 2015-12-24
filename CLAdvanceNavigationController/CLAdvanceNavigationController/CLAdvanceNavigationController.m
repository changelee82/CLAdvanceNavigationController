//
//  CLAdvanceNavigationController.m
//  CLAdvanceNavigationController
//
//  Created by 李辉 on 15/12/24.
//  Copyright © 2015年 李辉. All rights reserved.
//  https://github.com/changelee82/CLAdvanceNavigationController
//

#import "CLAdvanceNavigationController.h"

/** 动画持续时长 */
static const CGFloat kAnimationDuration = 0.5f;


@interface CLAdvanceNavigationController ()

/** 黑色背景视图 */
@property (nonatomic, strong) UIView *backgroundView;
/** 跳转前视图截图 */
@property (nonatomic, strong) UIImageView *sourceImageView;
/** 跳转后视图截图 */
@property (nonatomic, strong) UIImageView *destinationImageView;

@end



@implementation CLAdvanceNavigationController

/** 拥有动画效果的push页面操作 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (animated == NO)
    {
        [super pushViewController:viewController animated:NO];
        return;
    }
    
    if (self.viewControllers.count > 0)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        _sourceImageView = [self.class screenshot];
        [super pushViewController:viewController animated:NO];
        _destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        _backgroundView = [[UIView alloc] initWithFrame:_sourceImageView.bounds];
        _backgroundView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_backgroundView];
        
        // 添加跳转后视图截图到背景，并初始化
        _destinationImageView.layer.opacity = 0.5;
        _destinationImageView.layer.transform = [self backTransform3D];
        [_backgroundView addSubview:_destinationImageView];
        
        // 添加跳转前视图截图到背景，并初始化状态
        _sourceImageView.layer.opacity = 1.0;
        _sourceImageView.layer.transform = [self centerTransform3D];
        [_backgroundView addSubview:_sourceImageView];
        
        // 执行动画
        [_sourceImageView.layer addAnimation:[self viewMoveFront] forKey:nil];
        [_destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
    }
    else
    {
        [super pushViewController:viewController animated:YES];
    }
}

/** 拥有动画效果的pop页面操作 */
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (animated == NO)
    {
        return [super popViewControllerAnimated:NO];
    }
    
    if (self.viewControllers.count > 1)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        _sourceImageView = [self.class screenshot];
        UIViewController *result = [super popViewControllerAnimated:NO];
        _destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        _backgroundView = [[UIView alloc] initWithFrame:_sourceImageView.bounds];
        _backgroundView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_backgroundView];
        
        // 添加跳转前视图截图到背景
        _sourceImageView.layer.opacity = 1.0;
        _sourceImageView.layer.transform = [self centerTransform3D];
        [_backgroundView addSubview:_sourceImageView];
        
        // 添加跳转后视图截图到背景
        _destinationImageView.layer.opacity = 0.0;
        _destinationImageView.layer.transform = [self frontTransform3D];
        [_backgroundView addSubview:_destinationImageView];
        
        // 执行动画
        [_sourceImageView.layer addAnimation:[self viewMoveBack] forKey:nil];
        [_destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
        
        return result;
    }
    else
    {
        return [super popViewControllerAnimated:YES];
    }
}

/** 拥有动画效果的popToRoot页面操作 */
- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated;
{
    if (animated == NO)
    {
        return [super popToRootViewControllerAnimated:NO];
    }
    
    if (self.viewControllers.count > 1)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        _sourceImageView = [self.class screenshot];
        NSArray *result = [super popToRootViewControllerAnimated:NO];
        _destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        _backgroundView = [[UIView alloc] initWithFrame:_sourceImageView.bounds];
        _backgroundView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_backgroundView];
        
        // 添加跳转前视图截图到背景
        _sourceImageView.layer.opacity = 1.0;
        _sourceImageView.layer.transform = [self centerTransform3D];
        [_backgroundView addSubview:_sourceImageView];
        
        // 添加跳转后视图截图到背景
        _destinationImageView.layer.opacity = 0.0;
        _destinationImageView.layer.transform = [self frontTransform3D];
        [_backgroundView addSubview:_destinationImageView];
        
        // 执行动画
        [_sourceImageView.layer addAnimation:[self viewMoveBack] forKey:nil];
        [_destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
        
        return result;
    }
    else
    {
        return [super popToRootViewControllerAnimated:YES];
    }
}

/** 拥有动画效果的popToViewController页面操作 */
- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (animated == NO)
    {
        return [super popToViewController:viewController animated:NO];
    }
    
    if (self.viewControllers.count > 1)
    {
        // 获取跳转前视图截图，切换视图后，再获取跳转后视图截图
        _sourceImageView = [self.class screenshot];
        NSArray *result = [super popToViewController:viewController animated:NO];
        _destinationImageView = [self.class screenshot];
        
        // 添加黑色背景
        _backgroundView = [[UIView alloc] initWithFrame:_sourceImageView.bounds];
        _backgroundView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_backgroundView];
        
        // 添加跳转前视图截图到背景
        _sourceImageView.layer.opacity = 1.0;
        _sourceImageView.layer.transform = [self centerTransform3D];
        [_backgroundView addSubview:_sourceImageView];
        
        // 添加跳转后视图截图到背景
        _destinationImageView.layer.opacity = 0.0;
        _destinationImageView.layer.transform = [self frontTransform3D];
        [_backgroundView addSubview:_destinationImageView];
        
        // 执行动画
        [_sourceImageView.layer addAnimation:[self viewMoveBack] forKey:nil];
        [_destinationImageView.layer addAnimation:[self viewMoveCenter] forKey:nil];
        
        return result;
    }
    else
    {
        return [super popToViewController:viewController animated:YES];
    }
}

#pragma mark - 动画

/** 被移动到后面的视图的transform */
- (CATransform3D)backTransform3D
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0 / -900;    // 透视效果，近大远小
    t = CATransform3DScale(t, 0.50, 0.50, 1);
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
    t = CATransform3DScale(t, 2.50, 2.50, 1);
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
    if (_backgroundView)
    {
        [_backgroundView removeFromSuperview];
        _backgroundView = nil;
    }
    
    if (_sourceImageView)
    {
        [_sourceImageView removeFromSuperview];
        _sourceImageView = nil;
    }
    
    if (_destinationImageView)
    {
        [_destinationImageView removeFromSuperview];
        _destinationImageView = nil;
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
