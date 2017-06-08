//
//  FZYSubject.h
//  百思不得姐
//
//  Created by Feng Zuyan on 17/6/9.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZYSubject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profile_image;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, assign) NSInteger love;
@property (nonatomic, assign) NSInteger hate;
@property (nonatomic, assign) NSInteger repost;
@property (nonatomic, assign) NSInteger comment;


@end
