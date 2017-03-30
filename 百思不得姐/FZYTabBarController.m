//
//  FZYTabBarController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/3/22.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYTabBarController.h"

@interface FZYTabBarController ()

@end

@implementation FZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // normal text attrs
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // selected text attrs
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // set tab bar text style
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    UITableViewController *vc0 = [[UITableViewController alloc]init];
    [self setupOneChildViewController:vc0 withTitle:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    UIViewController *vc1 = [[UIViewController alloc]init];
    [self setupOneChildViewController:vc1 withTitle:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    UITableViewController *vc2 = [[UITableViewController alloc]init];
    [self setupOneChildViewController:vc2 withTitle:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    UIViewController *vc3 = [[UIViewController alloc]init];
    [self setupOneChildViewController:vc3 withTitle:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];

    
}

- (void) setupOneChildViewController:(UIViewController *)viewController withTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
//    CGFloat red = arc4random_uniform(100) / 100.0;
//    CGFloat green = arc4random_uniform(100) / 100.0;
//    CGFloat blue = arc4random_uniform(100) / 100.0;
//    UIColor *bgColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    viewController.view.backgroundColor = FZYRandomColor;
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:viewController];

}

@end
