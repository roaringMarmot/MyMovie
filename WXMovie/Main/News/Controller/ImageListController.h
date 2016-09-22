//
//  ImageListController.h
//  WXMovie
//
//  Created by MyMac on 16/8/29.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "BaseViewController.h"

@interface ImageListController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UICollectionView *_collectionView;
    
}
@property(nonatomic,strong)NSMutableArray *data;

@end
