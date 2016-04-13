//
//  YXRootItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/13.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXInfoItem.h"
#import "YXTopicItem.h"

@interface YXRootItem : NSObject

@property (nonatomic, strong) YXInfoItem *info;
@property (nonatomic, strong) NSArray *list;

@end
