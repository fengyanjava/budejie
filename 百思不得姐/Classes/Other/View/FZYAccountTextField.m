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
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];
    
}

@end
