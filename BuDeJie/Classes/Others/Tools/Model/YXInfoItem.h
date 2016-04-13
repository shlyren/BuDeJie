//
//  YXInfoItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/13.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXInfoItem : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString *maxid;
@property (nonatomic, strong) NSString *maxtime;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSString *vendor;

@end
