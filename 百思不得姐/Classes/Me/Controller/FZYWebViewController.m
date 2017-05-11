//
//  FZYWebViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/5/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYWebViewController.h"

@interface FZYWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation FZYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
