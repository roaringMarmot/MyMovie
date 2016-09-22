//
//  NewsDetailViewController.m
//  WXMovie
//
//  Created by MyMac on 16/8/29.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()<UIWebViewDelegate>

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-64)];
//    //1.加载网络url
//    NSURL *url = [NSURL URLWithString:@"http://news.mtime.com/2013/08/31/1517208.html"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
//    [self.view addSubview:webView];
//
//    //2.加载本地的HTML代码
//    NSString *fliePath = [[NSBundle mainBundle]pathForResource:@"百度一下，你就知道" ofType:@"html"];
//    
//    NSString *s = [NSString stringWithContentsOfFile:fliePath encoding:NSUTF8StringEncoding error:nil];
//    
//    [webView loadHTMLString:s baseURL:nil];
    
    [self.view addSubview:_webView];
    [self _loadData];
    
    
    // Do any additional setup after loading the view.
}
-(void)_loadData{
    //读取json数据
    NSDictionary *jsonDic = (NSDictionary *)[WXDataService requestData:@"news_detail.json"];
    
    NSString *content = [jsonDic objectForKey:@"content"];//新闻内容
    NSString *source = [jsonDic objectForKey:@"source"];//新闻来源
    NSString *time = [jsonDic objectForKey:@"time"];//新闻时间
    NSString *author = [jsonDic objectForKey:@"author"];//新闻作者
    NSString *title = [jsonDic objectForKey:@"title"];//新闻标题
    
    //读取news.html
    NSString *fliePath = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:fliePath encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"html = %@",html);
    
    //子标题 来源 时间
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
    
    //编辑(作者)
    NSString *at = [NSString stringWithFormat:@"来自伟大的:%@",author];
    
    //拼接html文件
    NSString *htmlString = [NSString stringWithFormat:html,title,subTitle,content,at];
    NSLog(@"htmlStr = %@",htmlString);
    
    [_webView loadHTMLString:htmlString baseURL:nil];
    
    //自适应
//    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    
    //创建加载视图
    _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_activityView];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

//开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityView startAnimating];
}
//完成加载
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityView stopAnimating];
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
