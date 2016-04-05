//
//  YXMeViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXMeViewController.h"
#import "UIBarButtonItem+YXItem.h"
#import "YXSetttingViewController.h"

@interface YXMeViewController ()

@end

@implementation YXMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YXRandomlyColor;
    [self setUpNavigationItem];
}



#pragma mark - initial
- (void)setUpNavigationItem
{
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" selectedImage:@"mine-moon-icon-click" target:self action:@selector(nightIconClick:)];
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click" target:self action:@selector(settingIconClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, nightItem];
    self.navigationItem.title = @"我的";
}

#pragma mark - Events
- (void)nightIconClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}

- (void)settingIconClick
{
    [self.navigationController pushViewController:[YXSetttingViewController new] animated:true];
}

@end
