//
//  FZYFollowViewController.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/4/12.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYFollowViewController.h"
#import "FZYTalentViewController.h"
#import "FZYLoginRegisterViewController.h"

@implementation FZYFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZYViewControllerBgColor;
    
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" imageHighlighted:@"friendsRecommentIcon-click" actionTarget:self actionSelector:@selector(followClick)];
    
    
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(100, 100, 200, 40);
//    label.backgroundColor = [UIColor yellowColor];
//    label.font = [UIFont systemFontOfSize:20];
//    [self.view addSubview:label];
//    
//    NSAttributedString *first = [[NSAttributedString alloc] initWithString:@"好的啊"];
//    
//    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
//    attachment.image = [UIImage imageNamed:@"header_cry_icon"];
//    CGFloat textHeight = label.font.lineHeight;
//    attachment.bounds = CGRectMake(0, -(label.fzy_height - textHeight) * 0.5, textHeight, textHeight);
//    NSAttributedString *second = [NSAttributedString attributedStringWithAttachment:attachment];
//    
//    NSAttributedString *third = [[NSAttributedString alloc] initWithString:@"嗯呢好呀"];
//    
//    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] init];
//    [attributeText appendAttributedString:first];
//    [attributeText appendAttributedString:second];
//    [attributeText appendAttributedString:third];
//    
//    label.attributedText = attributeText;
}

- (void)followClick {
    FZYFunc
    
    UIViewController *vc = [[FZYTalentViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)loginRegisterClick {
    FZYLoginRegisterViewController *loginVC = [[FZYLoginRegisterViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
