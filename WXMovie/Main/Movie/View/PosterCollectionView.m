//
//  PosterCollectionView.m
//  WXMovie
//
//  Created by MyMac on 16/8/31.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"
@implementation PosterCollectionView
{
    NSString *identify;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    if (self) {
        //注册单元格
        identify = @"PosterCell";
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:identify];
    }

    return self;
}
#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //判断点击的单元格是不是当前选中单元格
    if (self.currentItem == indexPath.item) {
        
        PosterCell *pCell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [pCell flipCell];
        
    }else{
        //让选中的单元格居中显示
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //记录当前页
        self.currentItem = indexPath.item;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.movie  = self.data[indexPath.item];
    return cell;
}

//滑动到下一页单元格的时候，前面翻转的单元格翻转回来
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([(PosterCell *)cell isFilp] == 1) {
        [(PosterCell *)cell flipCell];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
