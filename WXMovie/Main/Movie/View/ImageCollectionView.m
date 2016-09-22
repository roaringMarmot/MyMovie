//
//  ImageCollectionView.m
//  WXMovie
//
//  Created by MyMac on 16/9/8.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "ImageCollectionView.h"

@implementation ImageCollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    if (self = [super initWithFrame:frame collectionViewLayout:flowLayout]) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        //实现代理
        self.delegate = self;
        self.dataSource = self;
        
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    return self;
}
//返回单元格的尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
    
}

//偏移
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
    
}

//重新设定分页效果
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%f",velocity.x);
    //最后停止下来时的偏移量
    NSLog(@"目标偏移量:%f",targetContentOffset->x);
    
    //计算滑动停止的时候，单元格的索引位置
    
    int index = (targetContentOffset->x + _pageWidth /2) / _pageWidth;
    
   
    //设置下一页的偏移量
    targetContentOffset->x = index * _pageWidth;
    
    //4.记录当前页
    self.currentItem = index;
    
}


//数据的个数
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
