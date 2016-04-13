//
//  YXRequestData.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXRequestData.h"
#import "YXHttpTool.h"
#import "YXConst.h"
#import "MJExtension.h"

#import "YXAdItem.h"
#import "YXSubscribeTagItem.h"
#import "YXMeSquareItem.h"

@implementation YXRequestData
/**
 *  请求广告数据
 */
+ (void)requestAdSuccess:(void (^)(YXADItem *adItem))success failure:(void (^)(NSError *error))failure
{
    
    /*http://mobads.baidu.com/cpro/ui/mads.php?code2=phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam
    */
    
    
    NSDictionary *parameters = @{@"code2" : @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"};
    
    [YXHttpTool GET:YXAdUrl parameters:parameters success:^(id responseObject) {
        
        NSArray *adItems = [YXADItem mj_objectArrayWithKeyValuesArray:responseObject[@"ad"]];
        
        if (success) success(adItems[0]);
        //YXLog(@"%@",adItems[0]);
        
    } failure:^(NSError *error) {
        if (failure) {
            YXLog(@"广告数据获取失败 %@", error);
        }
    }];
}


/**
 *  请求推荐标签数据
 */
+ (void)requestSubTagsSuccess:(void (^)(NSArray *subTags))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *parameters = @{@"a" : @"tag_recommend",
                                 @"c" : @"topic",
                                 @"action" : @"sub"
                                 };
    
    [YXHttpTool GET:YXBaseUrl parameters:parameters success:^(id responseObject) {
        
       // YXLog(@"%@", responseObject);
        if (success) {
            success([YXSubscribeTagItem mj_objectArrayWithKeyValuesArray:responseObject]);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            YXLog(@"推荐标签获取失败 %@", error);
        }
    }];
}

/**
 *  每次打开app后，点击“我”板块获得到的内容
 */
+ (void)requestMeSquareSuccess:(void (^)(NSArray *squares))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *parameters = @{@"a" : @"square",
                                 @"c" : @"topic",
                                };
    
    [YXHttpTool GET:YXBaseUrl parameters:parameters success:^(id responseObject) {
        
        if (success) {
            success([YXMeSquareItem mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]]);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            YXLog(@"推荐标签获取失败 %@", error);
        }
    }];
}

/**
 *  获取帖子数据
 */
+ (void)requestTopicParemeters:(id)paremeters success:(void (^)(YXRootItem *roopItem))success failure:(void (^)(NSError *error))failure
{
    [YXHttpTool GET:YXBaseUrl parameters:paremeters success:^(NSDictionary *responseObject) {
        
        //[responseObject writeToFile:@"/Users/Schnappi/Desktop/topic29.plist" atomically:YES];
        [YXRootItem mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list" : [YXTopicItem class]};
        }];
        [YXTopicItem mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"top_cmt" : [YXTopicTopCmtItem class]};
        }];
        [YXTopicTopCmtItem mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"topCmt_id" : @"id"};
        }];
        [YXUserItem mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"user_id" : @"id"};
        }];
        [YXTopicItem mj_setupIgnoredPropertyNames:^NSArray *{
            return @[@"rowHeight"];
        }];
        
        YXRootItem *root = [YXRootItem mj_objectWithKeyValues:responseObject];
        
        if (success) success(root);
        
    } failure:^(NSError *error) {
        if (failure) {
            YXLog(@"帖子获取失败 %@", error);
        }
    }];
}
@end









