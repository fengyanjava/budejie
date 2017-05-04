//
//  FZYMeCell.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/5/4.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYMeCell.h"

@implementation FZYMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        self.accessoryView = [[UISwitch alloc] init];
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.imageView.image == nil) {
        return;
    }
    
    self.imageView.fzy_y = 5;
    self.imageView.fzy_height = self.contentView.fzy_height - 2 * self.imageView.fzy_y;
    self.imageView.fzy_width = self.imageView.fzy_height;
    
    self.textLabel.fzy_x = self.imageView.fzy_right + 10;
}

@end
