//
//  USMovieCell.h
//  WXMovie
//
//  Created by MyMac on 16/8/26.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class StarView;
@interface USMovieCell : UITableViewCell{
    
    //各种子视图
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *ratingLabel;
    __weak IBOutlet UILabel *yearLabel;
    __weak IBOutlet StarView *starView;
}
@property(nonatomic,strong)Movie *movie;
@end
