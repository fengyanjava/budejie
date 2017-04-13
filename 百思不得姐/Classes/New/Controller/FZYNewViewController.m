//
//  FZYNewViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYNewViewController.h"

@implementation FZYNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
        
    self.navigationItem.leftBarButtonItem = [FZYItemManager itemWithImage:@"MainTagSubIcon" imageHighlighted:@"MainTagSubIconClick" actionTarget:self actionSelector:@selector(tagClick)];;
}

- (void)tagClick {
    FZYFunc
}

@end
