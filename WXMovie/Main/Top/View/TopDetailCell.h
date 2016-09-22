//
//  TopDetailCell.h
//  WXMovie
//
//  Created by MyMac on 16/9/9.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopDetail;
@interface TopDetailCell : UITableViewCell

@property(nonatomic,strong)TopDetail *topDetail;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
