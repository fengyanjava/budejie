//
//  FZYMeSquareButton.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/5/9.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYMeSquareButton.h"

@implementation FZYMeSquareButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageW = 60;
    CGFloat labelH = 20;
    CGFloat labelMargin = 5;
    
    self.imageView.fzy_width = imageW;
    self.imageView.fzy_height = self.imageView.fzy_width;
    self.imageView.fzy_centerX = self.fzy_width / 2;
    self.imageView.fzy_y = (self.fzy_height - (imageW + labelMargin + labelH)) / 2;
    
    self.titleLabel.fzy_x = 0;
    self.titleLabel.fzy_y = self.imageView.fzy_bottom + labelMargin;
    self.titleLabel.fzy_width = self.fzy_width;
    self.titleLabel.fzy_height = labelH;
}

@end
