//
//  UIView+FZYExtension.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/11.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "UIView+FZYExtension.h"

@implementation UIView (FZYExtension)

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end
