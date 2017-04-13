//
//  FZYItemManager.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/14.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYItemManager.h"

@implementation FZYItemManager

+ (UIBarButtonItem *)itemWithImage:(NSString *)image imageHighlighted:(NSString *)imageHighlighted actionTarget:(id)actionTarget actionSelector:(SEL)actionSelector {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageHighlighted] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:actionTarget action:actionSelector forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}



@end
