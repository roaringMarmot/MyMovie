//
//  TopViewController.h
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    
    __weak IBOutlet UICollectionView *_collectionView;
}
@property(nonatomic,strong)NSMutableArray *data;
@end
