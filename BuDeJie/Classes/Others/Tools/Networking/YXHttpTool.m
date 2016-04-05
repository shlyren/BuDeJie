//
//  YXHttpTool.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXHttpTool.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"

@implementation YXHttpTool
/**
 *  GET请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 *
 *  @return           dataTask
 */
+ (NSURLSessionDataTask *)GET:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    AFHTTPSessionManager *mananger = [AFHTTPSessionManager manager];
    
    mananger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    return [mananger GET:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [SVProgressHUD dismiss];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        
        if (success) success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        if (failure) failure(error);
    }];
    
}


/**
 *  POST请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 *
 *  @return           dataTask
 */
+ (NSURLSessionDataTask *)POST:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
     AFHTTPSessionManager *mananger = [AFHTTPSessionManager manager];
    return [mananger POST:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        
        if (success) success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        if (failure) failure(error);
    }];
}
@end
