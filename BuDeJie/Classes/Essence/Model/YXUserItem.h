//
//  YXUserItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/13.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXUserItem : NSObject

/** id  */
@property (nonatomic, strong) NSString *user_id;

/** 是否是vip */
@property (nonatomic, assign, getter=isVip)  BOOL is_vip;

/** 个人主页 */
@property (nonatomic, strong) NSString *personal_page;

/** 头像 */
@property (nonatomic, strong) NSString *profile_image;

/** qq uid */
@property (nonatomic, strong) NSString *qq_uid;

/** qzone_uid */
@property (nonatomic, strong) NSString *qzone_uid;

/** 性别 */
@property (nonatomic, strong) NSString *sex;

/** 用户名 */
@property (nonatomic, strong) NSString *username;

/** weibo_uid */
@property (nonatomic, strong) NSString *weibo_uid;



@end
