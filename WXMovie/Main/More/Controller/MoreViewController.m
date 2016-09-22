//
//  MoreViewController.m
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UIAlertViewDelegate>

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor blackColor];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
//    [self countCacheSize];
    
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self countCacheSize];
}

-(void)countCacheSize{
    //byte kb MB GB TB
    
    NSUInteger fileSize = [[SDImageCache sharedImageCache]getSize];
    
    _label.text = [NSString stringWithFormat:@"%.1f MB",fileSize / 1024 / 1024.0];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"清理缓存" message:@"卡死别怪我" delegate:self cancelButtonTitle:@"滚粗" otherButtonTitles:@"好啊", nil];
        
        [alertView show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache]clearDisk];
        
        [self countCacheSize];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
