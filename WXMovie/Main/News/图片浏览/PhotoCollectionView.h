//
//  PhotoCollectionView.h
//  WXMovie
//
//  Created by MyMac on 16/8/30.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *urls;
@end
