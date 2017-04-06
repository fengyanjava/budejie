//
//  FZYTabBar.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/7.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYTabBar.h"

@interface FZYTabBar ()

@property(nonatomic, weak) UIButton *publishButton;

@end

@implementation FZYTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat buttonW = self.bounds.size.width / 5;
    CGFloat buttonH = self.bounds.size.height;
    
    NSInteger index = 0;
    
    for (UIView *view in self.subviews) {
        if (view.class != NSClassFromString(@"UITabBarButton")) {
            continue;
        }
        CGFloat x = index * buttonW;
        view.frame = CGRectMake(x, 0, buttonW, buttonH);
        index = index == 1 ? index + 2 : index + 1;
    }
    
    self.publishButton.frame = CGRectMake(0, 0, buttonW, buttonH);
    self.publishButton.center = CGPointMake(self.bounds.size.width * 0.5, buttonH * 0.5);
}

- (UIButton *)publishButton {
    if (_publishButton == nil) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        
        _publishButton = publishButton;
    }
    return _publishButton;
}

- (void)publishClick {
    FZYFunc
}

@end
