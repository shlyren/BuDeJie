//
//  YXTopicItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/13.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTopicTopCmtItem.h"

typedef NS_ENUM (NSUInteger,YXTopicType) {
    YXTopicTypeAll = 1, // 全部
    YXTopicTypeVideo = 41, // 视频
    YXTopicTypeVoice = 31, // 声音
    YXTopicTypePicture = 10, // 图片
    YXTopicTypeWord = 29 // 段子
};

@interface YXTopicItem : NSObject

/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *passtime;
/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
/** 帖子类型 */
@property (nonatomic, assign) YXTopicType type;
/** 最热评论 */
@property (nonatomic, strong) NSArray *top_cmt;

/** 图片的宽度 */
@property (nonatomic, assign) CGFloat width;
/** 图片的高度 */
@property (nonatomic, assign) CGFloat height;
/** 小图 */
@property (nonatomic, strong) NSString *image0;
/** 中图 */
@property (nonatomic, strong) NSString *image2;
/** 大图 */
@property (nonatomic, strong) NSString *image1;
/** 播放数量 */
@property (nonatomic, assign) NSInteger playcount;
/** 声音文件的长度 */
@property (nonatomic, assign) NSInteger voicetime;


/** 是否为动态图 */
@property (nonatomic, assign) BOOL is_gif;
/** 是否为超长图 */
@property (nonatomic, assign, getter=isBigPicture) BOOL bigPicture;

/** rowHeight */
@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, assign) CGRect middleFrame;
@end
