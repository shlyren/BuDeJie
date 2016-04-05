//
//  YXRequestData.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YXADItem;

@interface YXRequestData : NSObject

/**
 *  请求广告数据
 *
 *  @param success 请求成功
 *  @param failure 请求失败
 */
+ (void)requestAdSuccess:(void (^)(YXADItem *adItem))success failure:(void (^)(NSError *error))failure;

/**
 *  请求推荐标签数据
 *
 *  @param success 请求成功
 *  @param failure 请求失败
 */
+ (void)requestSubTagsSuccess:(void (^)(NSArray *subTags))success failure:(void (^)(NSError *error))failure;

@end
