//
//  WXNavigationController.m
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "WXNavigationController.h"

@interface WXNavigationController ()

@end

@implementation WXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *textAtt = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:20]};
    self.navigationBar.titleTextAttributes = textAtt;
    // Do any additional setup after loading the view.
}
//修改状态栏
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
