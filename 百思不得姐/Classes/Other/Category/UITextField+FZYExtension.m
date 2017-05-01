//
//  UITextField+FZYExtension.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/5/2.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "UITextField+FZYExtension.h"

@implementation UITextField (FZYExtension)

- (UIColor *)placeholderColor {
    return [self valueForKeyPath:@"placeholderLabel.textColor"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
}

@end
