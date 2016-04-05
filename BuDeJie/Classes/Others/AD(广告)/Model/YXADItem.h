//
//  YXADItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXADItem : NSObject

/** 图片url */
@property (nonatomic, strong) NSString *w_picurl;

/** 广告目标url */
@property (nonatomic, strong) NSString *ori_curl;


/** 图片的高度 */
@property (nonatomic, assign) CGFloat w;
/** 图片的宽度 */
@property (nonatomic, assign) CGFloat h;

@end
