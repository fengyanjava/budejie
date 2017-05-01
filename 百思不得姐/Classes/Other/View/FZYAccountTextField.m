//
//  FZYAccountTextField.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/29.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYAccountTextField.h"
#import <objc/runtime.h>


@implementation FZYAccountTextField

- (void)awakeFromNib {
    self.tintColor = [UIColor whiteColor];
    
//    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];
    
//    unsigned int outCount;
//    Ivar *ivarList = class_copyIvarList([UITextField class], &outCount);
//
//    for (int i = 0; i < outCount; i++) {
//        Ivar ivar = ivarList[i];
//        NSLog(@"%s", ivar_getName(ivar));
//    }
//    
//    free(ivarList);
    
    [self setPlaceholderTextColor:[UIColor grayColor]];
    
//    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidBegin) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidEnd) name:UITextFieldTextDidEndEditingNotification object:self];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)editingDidBegin {
    self.placeholderColor = [UIColor whiteColor];
}

- (void)editingDidEnd {
    self.placeholderColor = [UIColor grayColor];
}

@end
