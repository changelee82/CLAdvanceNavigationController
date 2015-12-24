//
//  AppDelegate.h
//  CLAdvanceNavigationController
//
//  Created by 李辉 on 15/12/24.
//  Copyright © 2015年 李辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLAdvanceNavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**  全局导航栏 */
@property (strong, nonatomic) CLAdvanceNavigationController *navController;

@end

