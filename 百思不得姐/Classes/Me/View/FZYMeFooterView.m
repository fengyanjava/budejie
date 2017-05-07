//
//  FZYMeFooterView.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/5/5.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYMeFooterView.h"
#import "FZYMeSquare.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>

@implementation FZYMeFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.fzy_height = 300;
        [self getSquareData];
    }
    return self;
}

- (void)getSquareData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] =  @"square";
    params[@"c"] =  @"topic";
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"success %@ %@", [responseObject class], responseObject);
        NSArray *squares = [FZYMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
        [self createSquares:squares];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure %@", error);
    }];

}

- (void)createSquares:(NSArray *)squares {
    NSInteger squareCount = squares.count;
    
    NSInteger columnCount = 4;
    CGFloat buttonW = self.fzy_width / columnCount;
    CGFloat buttonH = buttonW;
    
    for (int i = 0; i < squareCount; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.backgroundColor = FZYRandomColor;
        [self addSubview:button];
        
        button.fzy_x = i % columnCount * buttonW;
        button.fzy_y = i / columnCount * buttonH;
        button.fzy_width = buttonW;
        button.fzy_height = buttonH;
        
        FZYMeSquare *square = squares[i];
        
        [button setTitle:square.name forState:UIControlStateNormal];
        
//        [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:square.icon] options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
//            [button setImage:image forState:UIControlStateNormal];
//        }];
        
        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
        
    }
}

@end
