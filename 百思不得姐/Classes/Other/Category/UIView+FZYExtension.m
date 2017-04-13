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

- (CGSize)fzy_size {
    return self.frame.size;
}

- (void)setFzy_size:(CGSize)fzy_size {
    CGRect frame = self.frame;
    frame.size = fzy_size;
    self.frame = frame;
}

- (CGFloat)fzy_x {
    return self.frame.origin.x;
}

- (void)setFzy_x:(CGFloat)fzy_x {
    CGRect frame = self.frame;
    frame.origin.x = fzy_x;
    self.frame = frame;
}

- (CGFloat)fzy_y {
    return self.frame.origin.y;
}

- (void)setFzy_y:(CGFloat)fzy_y {
    CGRect frame = self.frame;
    frame.origin.y = fzy_y;
    self.frame = frame;
}

- (CGFloat)fzy_centerX {
    return self.center.x;
}

- (void)setFzy_centerX:(CGFloat)fzy_centerX {
    CGPoint center = self.center;
    center.x = fzy_centerX;
    self.center = center;
}

- (CGFloat)fzy_centerY {
    return self.center.y;
}

- (void)setFzy_centerY:(CGFloat)fzy_centerY {
    CGPoint center = self.center;
    center.y = fzy_centerY;
    self.center = center;
}

- (CGFloat)fzy_right {
//    return self.fzy_x + self.fzy_width;
    return CGRectGetMaxX(self.frame);
}

- (void)setFzy_right:(CGFloat)fzy_right {
    self.fzy_x = fzy_right - self.fzy_width;
}

- (CGFloat)fzy_bottom {
//    return self.fzy_y + self.fzy_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setFzy_bottom:(CGFloat)fzy_bottom {
    self.fzy_y = fzy_bottom - self.fzy_height;
}

@end
