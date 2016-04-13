//
//  YXTopicTopCmtItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/13.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXUserItem.h"

@interface YXTopicTopCmtItem : NSObject
/** 内容 */
@property (nonatomic, strong) NSString *content;

/** 时间 */
@property (nonatomic, strong) NSString *ctime;

/** data_id */
@property (nonatomic, strong) NSString *data_id;

/** id */
@property (nonatomic, strong) NSString *topCmt_id;
/** 点赞数 */
@property (nonatomic, strong) NSString *like_count;

/** 用户信息 */
@property (nonatomic, strong) YXUserItem *user;


@end
