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
}

@end
