//
//  TopDetailCell.m
//  WXMovie
//
//  Created by MyMac on 16/9/9.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "TopDetailCell.h"
#import "TopDetail.h"
@implementation TopDetailCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_topDetail.userImage]];
    
    _nickNameLabel.text = _topDetail.nickName;
    _ratingLabel.text = _topDetail.rating;
    _contentLabel.text = _topDetail.userContent;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
