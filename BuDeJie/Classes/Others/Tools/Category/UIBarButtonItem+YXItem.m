//
//  UIBarButtonItem+YXItem.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/1.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIBarButtonItem+YXItem.h"

@implementation UIBarButtonItem (YXItem)

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName target:(id)target action:(SEL)action
{
    return [self itemWithImage:imageName highlightImage:nil selectedImage:nil target:target action:action];
}


+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName selectedImage:(NSString *)selectedImgName target:(id)target action:(SEL)action
{
    
    return [self itemWithImage:imageName highlightImage:nil selectedImage:selectedImgName target:target action:action];
}

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName highlightImage:(NSString *)highlightImgName target:(id)target action:(SEL)action
{
    return [self itemWithImage:imageName highlightImage:highlightImgName selectedImage:nil target:target action:action];
}

+ (UIBarButtonItem *)itemWithImage:(nullable NSString *)imageName highlightImage:(nullable NSString *)highlightImgName selectedImage:(nullable NSString *)selectedImgName target:(nullable id)target action:(nullable SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (imageName)
    {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (selectedImgName)
    {
        [btn setImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
    }
    
    if (highlightImgName)
    {
        [btn setImage:[UIImage imageNamed:highlightImgName] forState:UIControlStateHighlighted];
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn sizeToFit];
    
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}
@end
