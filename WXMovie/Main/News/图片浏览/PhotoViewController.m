//
//  PhotoViewController.m
//  WXMovie
//
//  Created by MyMac on 16/8/30.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    _isHide = NO;
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    //设置导航栏半透明
    [navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    //样式设置为黑色
    navigationBar.barStyle = UIBarStyleBlack;
    
    //设置为半透明
    navigationBar.translucent = YES;
    
    
    //设置返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    PhotoCollectionView *collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    [self.view addSubview:collectionView];
    
    //传递数据
    collectionView.urls = _urls;
    
    //滚动到指定单元格
    [collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    
    //监听图片被单击的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tap:) name:@"玉材" object:nil];
    
    // Do any additional setup after loading the view.
}
-(void)tap:(NSNotification *)noti{
    _isHide =! _isHide;
    [self.navigationController setNavigationBarHidden:_isHide animated:YES];
    
}
-(BOOL)prefersStatusBarHidden{
    return _isHide;
}
-(void)backAction{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
