//
//  NSDate+FZYExtension.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/6/25.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "NSDate+FZYExtension.h"

@implementation NSDate (FZYExtension)

- (BOOL)isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitYear fromDate:self] == [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
}

@end
