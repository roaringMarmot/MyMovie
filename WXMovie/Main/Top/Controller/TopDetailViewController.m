//
//  TopDetailViewController.m
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "TopDetailViewController.h"
#import "TopDetail.h"
#import "TopDetailCell.h"
@interface TopDetailViewController ()

@end

@implementation TopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _requestData];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    // Do any additional setup after loading the view.
}
-(void)_requestData{
    NSDictionary *detail = (NSDictionary *)[WXDataService requestData:@"movie_detail.json"];
    NSDictionary *comment = (NSDictionary *)[WXDataService requestData:@"movie_comment.json"];
    
    _commentData = [[NSMutableArray alloc]init];
    
    NSArray *commentArr = comment[@"list"];
    
    for (NSDictionary *dic in commentArr) {
        _topDetail = [[TopDetail alloc]init];
        
        _topDetail.userImage = dic[@"userImage"];
        _topDetail.nickName = dic[@"nickname"];
        _topDetail.rating = dic[@"rating"];
        _topDetail.userContent = dic[@"content"];
        
        [_commentData addObject:_topDetail];
        
    }
    //顶部单元格数据
    _topDetail.images = detail[@"images"];
    _topDetail.TopImage = detail[@"image"];
    _topDetail.titleCn = detail[@"titleCn"];
    _topDetail.titleEn = detail[@"titleEn"];
    _topDetail.content = detail[@"content"];
    
    //刷新表视图
    [_tableView reloadData];
    
    
    
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _commentData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell" forIndexPath:indexPath];
        UIImageView *titleImage = [tableView viewWithTag:200];
        [titleImage sd_setImageWithURL:[NSURL URLWithString:_topDetail.TopImage]];
        
        UILabel *titleCn = [tableView viewWithTag:201];
        titleCn.text = _topDetail.titleCn;
        
        UILabel *titleEn = [tableView viewWithTag:202];
        titleEn.text = _topDetail.titleEn;
        
        UITextView *textView = [tableView viewWithTag:203];
        textView.text = _topDetail.content;
        
        return cell;
    }
    else if (indexPath.row == 1)
    {
        TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        UIImageView *image1 = [tableView viewWithTag:300];
        [image1 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[0]]];
        UIImageView *image2 = [tableView viewWithTag:301];
        [image2 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[1]]];
        UIImageView *image3 = [tableView viewWithTag:302];
        [image3 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[2]]];
        UIImageView *image4 = [tableView viewWithTag:303];
        [image4 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[3]]];
        return cell;
        
    }
    else{
        TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentaryCell" forIndexPath:indexPath];
        
        cell.topDetail = _commentData[indexPath.row - 2];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 150;
    }else if (indexPath.row == 1){
        return 85;
    }else if([self.index isEqual:indexPath]){
        //取出正确的索引的model
        TopDetail *top = self.commentData[indexPath.row - 2];
        
        //取出评论的内容
        NSString *text = top.userContent;
        
        
        CGRect frame = [text boundingRectWithSize:CGSizeMake(250, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil];
//        NSLog(@"frame.size.heigt = %.1f",frame.size.height);
        
            return frame.size.height + 58;
        
    }
    else return 80;
}

//点击单元格
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![_index isEqual:indexPath]) {
        self.index = indexPath;
//        NSArray *indexPaths = @[indexPath];
        //刷新单元格
        [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
