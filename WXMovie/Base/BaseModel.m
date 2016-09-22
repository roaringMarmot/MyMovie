//
//  BaseModel.m
//  WXMovie
//
//  Created by MyMac on 16/8/29.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(id)initContentWithDic:(NSDictionary *)jsonDic{
    self = [super init];
    if (self) {
        [self setAttributes:jsonDic];
    }
    return self;
}
-(void)setAttributes:(NSDictionary *)jsonDic{
    
    NSDictionary *mapDic = [self attributeMapDictionary:jsonDic];
    
    
    for (NSString *jsonKey in mapDic) {
        
        //modelArr:"newsId"
        //jsonKey:"id"
        
        NSString *modelArr = [mapDic objectForKey:jsonKey];
//        NSLog(@"modeArr = %@",modelArr);
        SEL seletor = [self stringToSel:modelArr];
        //判断self 是否有selector方法
        if ([self respondsToSelector:seletor]) {
            //json字典中的value
            id value = [jsonDic objectForKey:jsonKey];
            
            if ([value isKindOfClass:[NSNull class]]) {
                value = @"";
            }
            
            //调用属性的设置器方法，参数是json中的value
            [self performSelector:seletor withObject:value];
        }
    }
    
}


-(SEL)stringToSel:(NSString *)attName{
    //截取首字母
    NSString *first = [[attName substringToIndex:1]uppercaseString];
    NSString *end = [attName substringFromIndex:1];
    
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@:",first,end];
//    NSLog(@"%@",setMethod);
    //将字符串转换成sel类型
    return NSSelectorFromString(setMethod);
    
    
}
//建立映射关系

-(NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic{
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
//    NSDictionary *mapDic = @{@"id":@"imageId"};
    
    
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];

    }
//    NSLog(@"-----------%@",mapDic);
    return mapDic;
}
@end
