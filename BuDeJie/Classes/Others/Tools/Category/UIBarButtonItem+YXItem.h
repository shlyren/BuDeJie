//
//  UIBarButtonItem+YXItem.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/1.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YXItem)

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName selectedImage:(NSString *)selectedImgName target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName highlightImage:(NSString *)highlightImgName target:(id)target action:(SEL)action;

@end
