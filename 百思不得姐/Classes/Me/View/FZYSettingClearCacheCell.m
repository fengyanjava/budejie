//
//  FZYSettingClearCacheCell.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/5/29.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYSettingClearCacheCell.h"
#import <SDImageCache.h>
#import <SVProgressHUD.h>

@implementation FZYSettingClearCacheCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSUInteger cacheSize = [[SDImageCache sharedImageCache] getSize];
        NSString *cacheSizeStr;
        if (cacheSize > 1000000) {
            cacheSizeStr = [NSString stringWithFormat:@"%.2fMB", 1.0f * cacheSize / 1000000];
        } else if (cacheSize > 1000) {
            cacheSizeStr = [NSString stringWithFormat:@"%.2fKB", 1.0f * cacheSize / 1000];
        } else {
            cacheSizeStr = [NSString stringWithFormat:@"%zdB", cacheSize];
        }
        
        self.textLabel.text = [NSString stringWithFormat:@"清除缓存（%@）", cacheSizeStr];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearCache)];
        
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)clearCache {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"正在清除缓存..."];
    
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        self.textLabel.text = @"清除缓存（0B）";
        [SVProgressHUD dismiss];
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
