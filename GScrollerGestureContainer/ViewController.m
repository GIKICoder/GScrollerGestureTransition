//
//  ViewController.m
//  GScrollerGestureContainer
//
//  Created by GIKI on 2019/8/20.
//  Copyright © 2019 GIKI. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button setTitle:@"TEST" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 220, 200, 100);
    button.backgroundColor = UIColor.redColor;
    
    self.view.backgroundColor = UIColor.orangeColor;
}

- (void)buttonClick:(UIButton *)sender
{
    TestViewController * test  = [[TestViewController alloc] init];
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:test];
//      nav.modalPresentationCapturesStatusBarAppearance = YES;
    test.modalPresentationStyle = UIModalPresentationOverCurrentContext;
  
    [self presentViewController:test animated:YES completion:nil];
}
@end
