//
//  YXTabBar.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/1.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTabBar.h"

@interface YXTabBar ()
@property (nonatomic, weak) UIButton *plusBtn;

@end

@implementation YXTabBar

- (UIButton *)plusBtn
{
    if (_plusBtn == nil) {
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [plusBtn sizeToFit];
        
        [self addSubview:plusBtn];
        _plusBtn = plusBtn;
    }
    return _plusBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width / (self.items.count + 1);
    
    NSInteger i = 0;
    for (UIView *tabBarButton in self.subviews)
    {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            if (i == 2)
            {
                self.plusBtn.center = CGPointMake(self.width * 0.5, self.height * 0.5);
                i++;
            }
            
            tabBarButton.frame = CGRectMake(i * width, 0, width, self.height);
            i++;
        }
        
    }
}

@end
