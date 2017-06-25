//
//  FZYSubject.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/6/9.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYSubject.h"

@implementation FZYSubject

- (NSString *)created_at {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createdAtDate = [formatter dateFromString:_created_at];
    
    if (createdAtDate.isThisYear) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        if ([calendar isDateInToday:createdAtDate]) {
            NSCalendarUnit unit = NSCalendarUnitHour | NSCalendarUnitMinute;
            NSDateComponents *componets = [calendar components:unit fromDate:createdAtDate toDate:[NSDate date] options:0];
            if (componets.hour > 0) {
                return [NSString stringWithFormat:@"%zd小时前", componets.hour];
            } else if (componets.minute > 0) {
                return [NSString stringWithFormat:@"%zd分钟前", componets.minute];
            } else {
                return @"刚刚";
            }
        } else if ([calendar isDateInYesterday:createdAtDate]) {
            formatter.dateFormat = @"昨天 HH:mm:ss";
            return [formatter stringFromDate:createdAtDate];
        } else {
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            return [formatter stringFromDate:createdAtDate];
        }
    } else {
        return _created_at;
    }
}

@end
