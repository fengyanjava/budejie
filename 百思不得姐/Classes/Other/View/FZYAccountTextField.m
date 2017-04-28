//
//  FZYAccountTextField.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/29.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYAccountTextField.h"

@implementation FZYAccountTextField

- (void)awakeFromNib {
    self.tintColor = [UIColor whiteColor];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [attributes setObject:@1 forKey:NSStrikethroughStyleAttributeName];
    
    
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
    [attrString addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, 1)];
    [attrString setAttributes:attributes range:NSMakeRange(2, self.placeholder.length - 2)];
    self.attributedPlaceholder = attrString;
}

@end
