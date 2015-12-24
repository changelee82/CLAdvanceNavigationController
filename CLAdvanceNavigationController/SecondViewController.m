//
//  SecondViewController.m
//  CLAdvanceNavigationController
//
//  Created by 李辉 on 15/12/24.
//  Copyright © 2015年 李辉. All rights reserved.
//

#import "SecondViewController.h"
#import "ThridViewController.h"

@interface SecondViewController ()

- (IBAction)pushButtonClick:(UIButton *)sender;
- (IBAction)popButtonClick:(UIButton *)sender;

@end

@implementation SecondViewController

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

- (IBAction)pushButtonClick:(UIButton *)sender
{
    ThridViewController *thridVC = [[ThridViewController alloc] init];
    [self.navigationController pushViewController:thridVC animated:YES];
}

- (IBAction)popButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
