//
//  FZYSettingViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/20.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYSettingViewController.h"
#import <SDImageCache.h>

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
    
    [self getCacheSize];
}

- (void)getCacheSize {
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *path = [cachePath stringByAppendingPathComponent:@"default"];
//    FZYLog(@"%@", path);
    
    NSFileManager *manager = [NSFileManager defaultManager];
//    NSDictionary *attrs = [manager attributesOfItemAtPath:path error:nil];
//    FZYLog(@"%@", attrs);
    
    NSArray *subPaths = [manager subpathsAtPath:path];
//    FZYLog(@"%@", subPaths);
    
    NSUInteger size = 0;
    
    for (NSString *subPath in subPaths) {
        NSString *fullPath = [path stringByAppendingPathComponent:subPath];
        NSDictionary *attrs = [manager attributesOfItemAtPath:fullPath error:nil];
//        size += [attrs[NSFileSize] unsignedIntegerValue];
        size += attrs.fileSize;
    }
    
    FZYLog(@"%zd", size);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"设置";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
