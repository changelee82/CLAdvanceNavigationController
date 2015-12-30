//
//  FirstViewController.m
//  CLAdvanceNavigationController
//
//  Created by 李辉 on 15/12/24.
//  Copyright © 2015年 李辉. All rights reserved.
//

#import "FirstViewController.h"
#import "UINavigationController+Advance.h"
#import "SecondViewController.h"

@interface FirstViewController ()

- (IBAction)testButtonClick:(UIButton *)sender;

@end

@implementation FirstViewController

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


- (IBAction)testButtonClick:(UIButton *)sender
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushAdvanceViewController:secondVC animated:YES];
    
}
@end
