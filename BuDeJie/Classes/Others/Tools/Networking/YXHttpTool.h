//
//  YXHttpTool.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXHttpTool : NSObject

/**
 *  取消
 */
+ (void)cancel;

/**
 *  GET请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)GET:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


/**
 *  POST请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)POST:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
