//
//  FZYSettingViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/20.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYSettingViewController.h"
#import "FZYSettingClearCacheCell.h"

static NSString * const ClearCacheID = @"clear_cache";

@interface FZYSettingViewController ()

@end

@implementation FZYSettingViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    self.navigationItem.title = @"设置";
    
    [self.tableView registerClass:[FZYSettingClearCacheCell class] forCellReuseIdentifier:ClearCacheID];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FZYSettingClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:ClearCacheID];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FZYFunc;
}

@end
