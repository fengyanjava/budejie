//
//  FZYFollowViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYFollowViewController.h"

@implementation FZYFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [FZYItemManager itemWithImage:@"friendsRecommentIcon" imageHighlighted:@"friendsRecommentIcon-click" actionTarget:self actionSelector:@selector(followClick)];
}

- (void)followClick {
    FZYFunc
}

@end
