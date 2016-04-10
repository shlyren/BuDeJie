//
//  UITextField+placeholder.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/6.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UITextField+placeholder.h"
#import <objc/message.h>

@implementation UITextField (placeholder)

+ (void)load
{
    Method setPlaceholder = class_getInstanceMethod(self, @selector(setPlaceholder:));
    Method set_Placeholder = class_getInstanceMethod(self, @selector(set_Placeholder:));
    method_exchangeImplementations(setPlaceholder, set_Placeholder);
}

- (void)set_Placeholder:(NSString *)placeholder
{
    // 设置占位文字
    [self set_Placeholder:placeholder];
    [self setPlaceholderColor:self.placeholderColor];
    
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    // 保存占位文字颜色
    objc_setAssociatedObject(self, "placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    // 去除占位文字lable
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    // 设置颜色
    placeholderLabel.textColor = placeholderColor;
    
}

- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, "placeholderColor");
}
@end
