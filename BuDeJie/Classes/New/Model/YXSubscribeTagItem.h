//
//  YXSubscribeTagItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXSubscribeTagItem : NSObject

/** 名字 */
@property (nonatomic, strong) NSString *theme_name;
/** 图片url */
@property (nonatomic, strong) NSString *image_list;

/** 订阅数 */
@property (nonatomic, strong) NSString *sub_number;
@end
