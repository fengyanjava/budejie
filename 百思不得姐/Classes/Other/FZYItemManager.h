//
//  FZYItemManager.h
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/14.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZYItemManager : NSObject

+ (UIBarButtonItem *)itemWithImage:(NSString *)image imageHighlighted:(NSString *)imageHighlighted actionTarget:(id)actionTarget actionSelector:(SEL)actionSelector;

@end
