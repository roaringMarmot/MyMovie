//
//  NewsViewController.h
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *data;
@end
