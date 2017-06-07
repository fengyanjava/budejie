//
//  FZYEssenceContentViewController.h
//  百思不得姐
//
//  Created by Feng Zuyan on 17/6/7.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, FZYEssenceType) {
    FZYEssenceTypeAll,
    FZYEssenceTypeVideo,
    FZYEssenceTypeVoice,
    FZYEssenceTypePicture,
    FZYEssenceTypeWord,
    FZYEssenceType_END
};

@interface FZYEssenceContentViewController : UITableViewController

- (instancetype)initWithType:(FZYEssenceType)type;

@end

