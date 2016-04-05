//
//  YXNewViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXNewViewController.h"
#import "UIBarButtonItem+YXItem.h"
#import "YXSubscribeTagViewController.h"

@interface YXNewViewController ()

@end

@implementation YXNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YXRandomlyColor;
    [self setUpNavigationItem];
    
}

#pragma mark - initial
- (void)setUpNavigationItem
{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" target:self action:@selector(subscribeTag)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

#pragma mark - Events
- (void)subscribeTag
{
    [self.navigationController pushViewController:[YXSubscribeTagViewController new] animated:true];
}

@end
