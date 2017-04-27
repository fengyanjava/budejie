//
//  FZYLoginRegisterViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/25.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYLoginRegisterViewController.h"

@interface FZYLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginLeadingConstraint;

@end

@implementation FZYLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)closeClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES]; // hide keyboard
}

- (IBAction)navigationRightBtnClick:(UIButton *)button {
    [self.view endEditing:YES];
    
    BOOL isLoginShown = self.loginLeadingConstraint.constant == 0;
    
    NSString *buttonTitle = isLoginShown ? @"已有账号" : @"注册账号";
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    
    self.loginLeadingConstraint.constant = isLoginShown ? -self.view.fzy_width : 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
