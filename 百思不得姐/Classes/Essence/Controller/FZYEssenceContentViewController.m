//
//  FZYEssenceContentViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/6/7.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYEssenceContentViewController.h"

@interface FZYEssenceContentViewController ()

@property (nonatomic, assign) FZYEssenceType essenceType;

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
    
    NSLog(@"type:%zd", self.essenceType);
    FZYFunc
    NSLog(@"---------");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"type:%zd row:%zd", self.essenceType, indexPath.row];
    
    return cell;
}

@end
