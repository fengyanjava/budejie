//
//  FZYQuickLoginButton.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/25.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYQuickLoginButton.h"

@implementation FZYQuickLoginButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.fzy_y = 0;
    self.imageView.fzy_centerX = self.fzy_width / 2;
    
    self.titleLabel.fzy_y = self.imageView.fzy_height + 5;
    self.titleLabel.fzy_centerX = self.fzy_width / 2;
}

@end
