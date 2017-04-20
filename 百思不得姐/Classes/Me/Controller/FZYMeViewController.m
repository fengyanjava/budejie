//
//  FZYMeViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYMeViewController.h"
#import "FZYSettingViewController.h"

@implementation FZYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    self.navigationItem.title = @"我的";
        
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" imageHighlighted:@"mine-moon-icon-click" actionTarget:self actionSelector:@selector(moonClick)];
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" imageHighlighted:@"mine-setting-icon-click" actionTarget:self actionSelector:@selector(settingClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

- (void)settingClick {
    FZYFunc
    FZYSettingViewController *vc = [[FZYSettingViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)moonClick {
    FZYFunc
}

@end
