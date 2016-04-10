//
//  YXTitleViewButton.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/9.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTitleViewButton.h"

@implementation YXTitleViewButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame])
    {
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{}
@end
