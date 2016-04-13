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

@interface YXHttpTool ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YXHttpTool

- (AFHTTPSessionManager *)manager
{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}


+ (void)cancel
{
     [[YXHttpTool shareHttpTool].manager.tasks makeObjectsPerformSelector:@selector(cancel)];
}


YXHttpTool *_instance;

+ (instancetype)shareHttpTool
{
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (void)GET:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    [[YXHttpTool shareHttpTool] GET:url parameters:parameters success:^(id responseObject) {
        
        if (success) success(responseObject);
        
    } failure:^(NSError *error) {
        
        if (failure) failure(error);
    }];
}

+ (void)POST:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    [[YXHttpTool shareHttpTool] POST:url parameters:parameters success:^(id responseObject) {
        if (success) success(responseObject);
    } failure:^(NSError *error) {
        if (failure) failure(error);
    }];
}

- (void)GET:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    [self.manager GET:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [SVProgressHUD dismiss];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        
        if (success) success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        if (failure) failure(error);
    }];

}

- (void)POST:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
   [self.manager POST:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        
        if (success) success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        if (failure) failure(error);
    }];
}


@end
