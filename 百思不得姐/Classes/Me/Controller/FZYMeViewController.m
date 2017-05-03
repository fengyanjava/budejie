//
//  FZYMeViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYMeViewController.h"
#import "FZYSettingViewController.h"

@implementation FZYMeViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    self.navigationItem.title = @"我的";
        
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" imageHighlighted:@"mine-moon-icon-click" actionTarget:self actionSelector:@selector(moonClick)];
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" imageHighlighted:@"mine-setting-icon-click" actionTarget:self actionSelector:@selector(settingClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"row %zd", indexPath.section];
    
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
