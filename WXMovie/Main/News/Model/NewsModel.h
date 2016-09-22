//
//  NewsModel.h
//  WXMovie
//
//  Created by MyMac on 16/8/28.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 {
 "newsid" : 1491520,
 "type" : 0,
 "title" : "科幻大作《全面回忆》全新预告片发布",
 "summary" : "",
 "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 }
 */
@interface NewsModel :BaseModel
@property(nonatomic,strong)NSNumber *newsId;
@property(nonatomic,strong)NSNumber *type;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *image;
@end
