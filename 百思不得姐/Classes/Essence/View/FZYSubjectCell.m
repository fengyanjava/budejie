//
//  FZYSubjectCell.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/6/18.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYSubjectCell.h"
#import <UIImageView+WebCache.h>

@interface FZYSubjectCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createAtLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentTextLabel;

@property (weak, nonatomic) IBOutlet UIView *commentView;
@property (weak, nonatomic) IBOutlet UILabel *commentTextLabel;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *hateButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation FZYSubjectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSubject:(FZYSubject *)subject {
    _subject = subject;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:subject.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nickNameLabel.text = subject.name;
    self.createAtLabel.text = subject.created_at;
    self.contentTextLabel.text = subject.text;
    
    NSString *likeText = [self formatNumber:subject.love defaultStr:@"赞"];
    [self.likeButton setTitle:likeText forState:UIControlStateNormal];
    
    NSString *hateText = [self formatNumber:subject.hate defaultStr:@"踩"];
    [self.hateButton setTitle:hateText forState:UIControlStateNormal];
    
    NSString *shareText = [self formatNumber:subject.repost defaultStr:@"分享"];
    [self.shareButton setTitle:shareText forState:UIControlStateNormal];
    
    NSString *commentText = [self formatNumber:subject.comment defaultStr:@"评论"];
    [self.commentButton setTitle:commentText forState:UIControlStateNormal];
}

- (NSString *)formatNumber:(NSInteger)number defaultStr:(NSString *)defaultStr {
    if (number == 0) {
        return defaultStr;
    }
    if (number > 999) {
        return [NSString stringWithFormat:@"%.1f千", 1.0 * number / 1000];
    } else {
        return [NSString stringWithFormat:@"%zd", number];
    }
}

- (IBAction)moreBtnClick:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= 10;
    frame.origin.y += 10;
    [super setFrame:frame];
}

@end
