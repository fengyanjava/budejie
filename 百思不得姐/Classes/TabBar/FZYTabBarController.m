//
//  FZYTabBarController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/3/22.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYTabBarController.h"

#import "FZYTabBar.h"

#import "FZYEssenceViewController.h"
#import "FZYNewViewController.h"
#import "FZYFollowViewController.h"
#import "FZYMeViewController.h"
#import "FZYNavigationController.h"

@interface FZYTabBarController ()

@end

@implementation FZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBarItemTextStyle];
    
    [self setupChildViewControllers];
    
    [self setSelectedIndex:2];
    
    [self setValue:[[FZYTabBar alloc]init] forKey:@"tabBar"];
    
}

- (void) setupChildViewControllers {
    [self setupOneChildViewController:[self createNavigationControllerWithRootVC:[[FZYEssenceViewController alloc]init]] withTitle:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupOneChildViewController:[self createNavigationControllerWithRootVC:[[FZYNewViewController alloc]init]] withTitle:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupOneChildViewController:[self createNavigationControllerWithRootVC:[[FZYFollowViewController alloc]init]] withTitle:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupOneChildViewController:[self createNavigationControllerWithRootVC:[[FZYMeViewController alloc]init]] withTitle:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

- (UINavigationController *)createNavigationControllerWithRootVC:(UIViewController *)rootVC {
    UINavigationController *controller = [[FZYNavigationController alloc] initWithRootViewController:rootVC];
    return controller;
}

- (void) setupTabBarItemTextStyle {
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
}

- (void) setupOneChildViewController:(UIViewController *)viewController withTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
//    viewController.view.backgroundColor = FZYRandomColor;
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = image.length ? [UIImage imageNamed:image] : nil;
    viewController.tabBarItem.selectedImage = selectedImage.length ? [UIImage imageNamed:selectedImage] : nil;
    [self addChildViewController:viewController];

}

@end
