//
//  FZYEssenceViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYEssenceViewController.h"

@interface FZYEssenceViewController ()

@property (nonatomic, weak) UIButton *titleButtonSelected;

@end

@implementation FZYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    [self setupNav];
    [self setupScrollView];
    [self setupTitlesView];
}

- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = FZYRandomColor;
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
}

- (void)setupTitlesView {
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    titlesView.frame = CGRectMake(0, 64, self.view.fzy_width, 35);
    [self.view addSubview:titlesView];
    
    NSArray<NSString *> *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titlesView.fzy_width / count;
    CGFloat titleButtonH = titlesView.fzy_height;
    
    for (NSUInteger i = 0; i < count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
}

- (void)setupNav {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" imageHighlighted:@"MainTagSubIconClick" actionTarget:self actionSelector:@selector(tagClick)];
}

- (void)titleClick:(UIButton *)titleButton {
    self.titleButtonSelected.enabled = YES;
    titleButton.enabled = NO;
    self.titleButtonSelected = titleButton;
}

- (void)tagClick {
    FZYFunc
}

@end
