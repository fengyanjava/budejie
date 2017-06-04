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
        
        self.textLabel.text = @"清除缓存(正在计算...)";
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [indicatorView startAnimating];
        self.accessoryView = indicatorView;
        
        self.userInteractionEnabled = NO;
        
        __weak typeof(self) weakSelf = self;
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            [NSThread sleepForTimeInterval:3.0f];
            
            NSUInteger cacheSize = [[SDImageCache sharedImageCache] getSize];
            
            if (weakSelf == nil) {
                return;
            }
            
            NSString *cacheSizeStr;
            if (cacheSize > 1000000) {
                cacheSizeStr = [NSString stringWithFormat:@"%.2fMB", 1.0f * cacheSize / 1000000];
            } else if (cacheSize > 1000) {
                cacheSizeStr = [NSString stringWithFormat:@"%.2fKB", 1.0f * cacheSize / 1000];
            } else {
                cacheSizeStr = [NSString stringWithFormat:@"%zdB", cacheSize];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.userInteractionEnabled = YES;
                
                weakSelf.textLabel.text = [NSString stringWithFormat:@"清除缓存（%@）", cacheSizeStr];
                weakSelf.accessoryView = nil;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(clearCache)];
                
                [weakSelf addGestureRecognizer:tapGesture];
                
            });
            
        });
        
        
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

- (void)dealloc {
    FZYFunc
}

@end
