//
//  UIView+FZYExtension.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/11.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "UIView+FZYExtension.h"

@implementation UIView (FZYExtension)

- (CGFloat)fzy_width {
    return self.frame.size.width;
}

- (CGFloat)fzy_height {
    return self.frame.size.height;
}

- (void)setFzy_width:(CGFloat)fzy_width {
    CGRect frame = self.frame;
    frame.size.width = fzy_width;
    self.frame = frame;
}

- (void)setFzy_height:(CGFloat)fzy_height {
    CGRect frame = self.frame;
    frame.size.height = fzy_height;
    self.frame = frame;
}

@end
