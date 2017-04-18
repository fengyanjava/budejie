//
//  FZYTalentViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/19.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYTalentViewController.h"

@implementation FZYTalentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = FZYRandomColor;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
}

- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
