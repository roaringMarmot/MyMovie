//
//  PhotoViewController.h
//  WXMovie
//
//  Created by MyMac on 16/8/30.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
{
    BOOL _isHide;
}
@property(nonatomic,strong)NSArray *urls;
@property(nonatomic,strong)NSIndexPath *indexPath;
@end
