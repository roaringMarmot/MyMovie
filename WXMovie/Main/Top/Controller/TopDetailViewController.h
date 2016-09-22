//
//  TopDetailViewController.h
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "BaseViewController.h"
@class TopDetail;
@interface TopDetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)TopDetail *topDetail;
@property(nonatomic,copy)NSMutableArray *commentData;
@property(nonatomic,strong)NSIndexPath *index;

@end
