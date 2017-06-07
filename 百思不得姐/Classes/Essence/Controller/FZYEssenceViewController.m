//
//  FZYEssenceViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYEssenceViewController.h"
#import "FZYEssenceContentViewController.h"

@interface FZYEssenceViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIButton *titleButtonSelected;
@property (nonatomic, weak) UIView *indicatorView;
@property (nonatomic, weak) UIView *titlesView;
@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation FZYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    [self setupNav];
    [self setupChildVCs];
    [self setupScrollView];
    [self setupTitlesView];
    
    
    [self selectTitle:self.titlesView.subviews.firstObject animated:NO];
    [self selectChildViewController:0];
}

- (void)setupChildVCs {
    for (NSUInteger type = 0; type < FZYEssenceType_END; type++) {
        FZYEssenceContentViewController *vc = [[FZYEssenceContentViewController alloc] initWithType:type];
        [self addChildViewController:vc];
    }
    
}

- (void)setupScrollView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.backgroundColor = FZYRandomColor;
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.fzy_width, 0);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
//    NSUInteger count = self.childViewControllers.count;
//    for (NSInteger i = 0; i < count; i++) {
//        UITableView *vcView = (UITableView *)self.childViewControllers[i].view;
//        vcView.backgroundColor = FZYRandomColor;
//        vcView.fzy_x = i * vcView.fzy_width;
//        vcView.fzy_y = 0;
//        vcView.fzy_height = scrollView.fzy_height;
//        vcView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
//        vcView.scrollIndicatorInsets = vcView.contentInset;
//        [scrollView addSubview:vcView];
//    }
    
}

- (void)setupTitlesView {
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    titlesView.frame = CGRectMake(0, 64, self.view.fzy_width, 35);
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    NSArray<NSString *> *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titlesView.fzy_width / count;
    CGFloat titleButtonH = titlesView.fzy_height;
    
    for (NSUInteger i = 0; i < count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        titleButton.tag = i;
        
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
    
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.fzy_height = 1;
    indicatorView.fzy_y = titlesView.fzy_height - indicatorView.fzy_height;
    [titlesView addSubview:indicatorView];
    
    self.indicatorView = indicatorView;
    
}

- (void)setupNav {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" imageHighlighted:@"MainTagSubIconClick" actionTarget:self actionSelector:@selector(tagClick)];
}

- (void)titleClick:(UIButton *)titleButton {
    [self selectTitle:titleButton animated:YES];
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.fzy_width;
    [self.scrollView setContentOffset:offset animated:YES];
}

- (void)selectTitle:(UIButton *)titleButton animated:(BOOL)animated {
    self.titleButtonSelected.enabled = YES;
    titleButton.enabled = NO;
    self.titleButtonSelected = titleButton;
    
    CGFloat titleW = titleButton.titleLabel.fzy_width;
    if (titleW == 0) { // 第一次选中时，titleButton还没有宽度
        titleW = [titleButton.currentTitle sizeWithAttributes:@{NSFontAttributeName : titleButton.titleLabel.font}].width;
    }
    
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.indicatorView.fzy_width = titleW;
            self.indicatorView.fzy_centerX = titleButton.center.x;
        }];
    } else {
        self.indicatorView.fzy_width = titleW;
        self.indicatorView.fzy_centerX = titleButton.center.x;
    }
    
}

- (void)tagClick {
    FZYFunc
}

#pragma mark 选中且添加子控制器View
- (void)selectChildViewController:(NSUInteger)index {
//    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.fzy_width;
    
    UIViewController *childVC = self.childViewControllers[index];
    
//    if (childVC.view.superview) { // already added
//        return;
//    }
//    if (childVC.view.window) { // already added
//        return;
//    }
    if (childVC.isViewLoaded) { // already added
        return;
    }
    
//    childVC.view.frame = self.scrollView.bounds;
    childVC.view.fzy_x = index * self.scrollView.fzy_width;
    childVC.view.fzy_y = 0;
    childVC.view.fzy_width = self.scrollView.fzy_width;
    childVC.view.fzy_height = self.scrollView.fzy_height;
    [self.scrollView addSubview:childVC.view];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.fzy_width;
    [self selectChildViewController:index];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger index = scrollView.contentOffset.x / scrollView.fzy_width;
    UIButton *button = self.titlesView.subviews[index];
    [self selectTitle:button animated:YES];
    [self selectChildViewController:index];
}

@end
