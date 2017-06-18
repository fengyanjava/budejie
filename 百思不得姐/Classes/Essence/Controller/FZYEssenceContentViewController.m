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
#import <MJRefresh.h>
#import "FZYRefreshHeader.h"
#import "FZYRefreshFooter.h"
#import "FZYHTTPSessionManager.h"
#import "FZYSubjectCell.h"

static NSString *const SubjectCellId = @"subject";

@interface FZYEssenceContentViewController ()

@property (nonatomic, assign) FZYEssenceType essenceType;

@property (nonatomic, strong) NSString *maxtime;
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
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    [self setupTableView];
    
    NSLog(@"type:%zd", self.essenceType);
    FZYFunc
    NSLog(@"---------");
    
    self.subjects = [NSMutableArray array];
    
    [self setupRefresh];
    
}

- (void)setupTableView {
    self.tableView.rowHeight = 500;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FZYSubjectCell class]) bundle:nil] forCellReuseIdentifier:SubjectCellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setupRefresh {
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self loadNewSubjects];
//    }];
    
    self.tableView.mj_header = [FZYRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewSubjects)];
    
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [FZYRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}

- (void)loadMore {
    [self getSubjectList:YES];
}

#pragma mark - load data
- (void)loadNewSubjects {
    [self getSubjectList:NO];
}

- (void)getSubjectList:(BOOL)isLoadMore {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    if (isLoadMore) {
        params[@"maxtime"] = self.maxtime;
    }
    
    [[FZYHTTPSessionManager manager] GET:BDJ_API_URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        if (!isLoadMore) {
            [self.subjects removeAllObjects];
        }
        
        NSArray<FZYSubject *> *subjects = [FZYSubject mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.subjects addObjectsFromArray:subjects];
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure:%@", error);
        [self.tableView.mj_header endRefreshing];
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

    FZYSubject *subject = self.subjects[indexPath.row];
    
    FZYSubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:SubjectCellId];
    cell.subject = subject;
    
    return cell;
}


@end
