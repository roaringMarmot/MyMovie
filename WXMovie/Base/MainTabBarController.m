//
//  MainTabBarController.m
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "MainTabBarController.h"
#import "WXTabBarItem.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

//修改状态栏
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)viewWillAppear:(BOOL)animated{
    

    [super viewWillAppear:YES];
    [self _createTabbar];

}
//构建自定义标签栏
-(void)_createTabbar{

    for (UIView *view in self.tabBar.subviews) {
 
         //取得UITabBarButton的类对象
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {

            //移除tabbar上的按钮对象
            [view removeFromSuperview];
        }
    }
    NSArray *imgArr = @[@"movie_home",@"msg_new",@"start_top250@2x",@"icon_cinema",@"more_setting"];
    NSArray *titleArr = @[@"电影",@"新闻",@"top250",@"影院",@"更多"];
    
    
    CGFloat buttonWidth = KScreenWidth / imgArr.count;
    CGFloat buttonHeight = CGRectGetHeight(self.tabBar.frame);
    
    if (_selectImg == nil) {
        //1.创建阴影遮罩视图
        _selectImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 55, 45)];
        
        //2.添加图片
        _selectImg.image = [UIImage imageNamed:@"selectTabbar_bg_all"];
        //3.添加到tabbar
        [self.tabBar addSubview:_selectImg];
    }
    
    for (int i = 0; i < imgArr.count; i++) {
        NSString *imgName = imgArr[i];
        NSString *title = titleArr[i];
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, buttonHeight);
//        
//        //创建标题
//        [button setTitle:title forState:UIControlStateNormal];
//        //创建图片
//        [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
////        button.backgroundColor = [UIColor colorWithRed:random()%255/255.0  green:random()%255/255.0 blue:random()%255/255.0 alpha:1.0];
//    
//        //设置标题字体
//        button.titleLabel.font = [UIFont systemFontOfSize:12];
//        
//        
//        //设置图片和标题文本的偏移，使得成为上下的格式，四个属性分别为顶左底右，数值是距离原位置的一个偏差(-为靠近，+为远离)
//        button.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(-15, 20, 0, 0);
//        
//        
//        [self.tabBar addSubview:button];
        
        //使用子类化的item来创建标签
        CGRect frame = CGRectMake(i*buttonWidth, 0, buttonWidth, buttonHeight);
        WXTabBarItem *item = [[WXTabBarItem alloc]initWithFrame:frame imageName:imgName title:title];
        [self.tabBar addSubview:item];
        item.tag = i + 100;
        
        //添加点击事件
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            _selectImg.center = item.center;
        }
    }
    
}
-(void)itemAction:(WXTabBarItem *)item{
    self.selectedIndex = item.tag - 100;
    //添加一个动画效果
    [UIView animateWithDuration:.25 animations:^{
        _selectImg.center = item.center;
    }];
    
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
