//
//  YXRequestData.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXRootItem.h"

@class YXADItem;

@interface YXRequestData : NSObject

/**
 *  请求广告数据
 */
+ (void)requestAdSuccess:(void (^)(YXADItem *adItem))success failure:(void (^)(NSError *error))failure;

/**
 *  请求推荐标签数据
 */
+ (void)requestSubTagsSuccess:(void (^)(NSArray *subTags))success failure:(void (^)(NSError *error))failure;


/**
 *  每次打开app后，点击“我”板块获得到的内容
 */
+ (void)requestMeSquareSuccess:(void (^)(NSArray *squares))success failure:(void (^)(NSError *error))failure;

/**
 *  获取帖子数据
 */
+ (void)requestTopicParemeters:(id)paremeters success:(void (^)(YXRootItem *roopItem))success failure:(void (^)(NSError *error))failure;
@end
