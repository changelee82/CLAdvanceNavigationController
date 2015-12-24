//
//  ThridViewController.m
//  CLAdvanceNavigationController
//
//  Created by 李辉 on 15/12/24.
//  Copyright © 2015年 李辉. All rights reserved.
//

#import "ThridViewController.h"

@interface ThridViewController ()

- (IBAction)rootButtonClick:(UIButton *)sender;
- (IBAction)popButtonClick:(UIButton *)sender;

@end

@implementation ThridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 解决导航栏遮挡视图的问题
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)rootButtonClick:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)popButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
