//
//  FZYEssenceContentViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/6/7.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYEssenceContentViewController.h"
#import <AFNetworking.h>
#import "FZYSubject.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>

@interface FZYEssenceContentViewController ()

@property (nonatomic, assign) FZYEssenceType essenceType;

@property (nonatomic, strong) NSMutableArray<FZYSubject *> *subjects;

@end

@implementation FZYEssenceContentViewController

- (instancetype)initWithType:(FZYEssenceType)type {
    if (self = [super init]) {
        self.essenceType = type;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    NSLog(@"type:%zd", self.essenceType);
    FZYFunc
    NSLog(@"---------");
    
    self.subjects = [NSMutableArray array];
    
    [self setupRefresh];
}

- (void)setupRefresh {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor yellowColor];
    headerView.fzy_width = self.tableView.fzy_width;
    headerView.fzy_height = 50;
    headerView.fzy_y = -headerView.fzy_height;
    [self.tableView addSubview:headerView];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"下拉刷新";
    [label sizeToFit];
    label.center = CGPointMake(headerView.fzy_width / 2, headerView.fzy_height / 2);
    [headerView addSubview:label];
    
}

#pragma mark - load data
- (void)loadNewSubjects {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    
    [[AFHTTPSessionManager manager] GET:BDJ_API_URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray<FZYSubject *> *subjects = [FZYSubject mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.subjects addObjectsFromArray:subjects];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure:%@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    FZYSubject *subject = self.subjects[indexPath.row];
    
    cell.textLabel.text = subject.name;
    cell.detailTextLabel.text = subject.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:subject.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    return cell;
}

@end
