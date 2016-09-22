//
//  TopDetail.h
//  WXMovie
//
//  Created by MyMac on 16/9/9.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "image" : "http://img31.mtime.cn/mt/2012/06/28/131128.94272291.jpg",
	"titleCn" : "摩尔庄园2海妖宝藏",
	"titleEn" : "Legend of The Moles-Treasure of Scylla",
	"rating" : "7.7",
	"year" : "2012",
	"content" : "摩尔庄园大电影系列第二部：《摩尔庄园海妖宝藏》继续讲述快乐、勇敢、热爱和平的小摩尔们战胜邪恶",
     images
 
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "yangna988",
 "rating" : "9.0",
 "content"
 */
@interface TopDetail : NSObject
@property(nonatomic,copy)NSString *TopImage;
@property(nonatomic,copy)NSString *titleCn;
@property(nonatomic,copy)NSString *titleEn;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSArray *images;

@property(nonatomic,copy)NSString *userImage;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *userContent;

@end
