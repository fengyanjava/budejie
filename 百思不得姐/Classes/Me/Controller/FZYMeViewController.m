//
//  FZYMeViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYMeViewController.h"
#import "FZYSettingViewController.h"
#import "FZYMeCell.h"
#import "FZYMeFooterView.h"

@implementation FZYMeViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    [self setupNav];
    
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = FZY_Margin;
    self.tableView.contentInset = UIEdgeInsetsMake(FZY_Margin - 35, 0, 0, 0);
    
    self.tableView.tableFooterView = [[FZYMeFooterView alloc] init];
}

- (void)setupNav {
    self.navigationItem.title = @"我的";
        
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" imageHighlighted:@"mine-moon-icon-click" actionTarget:self actionSelector:@selector(moonClick)];
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" imageHighlighted:@"mine-setting-icon-click" actionTarget:self actionSelector:@selector(settingClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

- (void)settingClick {
    FZYFunc
    FZYSettingViewController *vc = [[FZYSettingViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)moonClick {
    FZYFunc
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"me";
    FZYMeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[FZYMeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
        cell.textLabel.text = @"登录/注册";
    } else if (indexPath.section == 1) {
        cell.imageView.image = nil;
        cell.textLabel.text = @"离线下载";
    }
    
    return cell;
}

#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 300;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", NSStringFromCGRect(cell.frame));
}

@end
