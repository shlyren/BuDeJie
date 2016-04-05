//
//  YXFriendTrendsViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXFriendTrendsViewController.h"
#import "UIBarButtonItem+YXItem.h"
#import "YXLoginRegisterViewController.h"

@interface YXFriendTrendsViewController ()

@end

@implementation YXFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpNavigationItem];
}

#pragma mark - initial
- (void)setUpNavigationItem
{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightImage:@"friendsRecommentIconClick" target:self action:@selector(friendsRecomment)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.title = @"我的关注";
}

#pragma mark - Events
- (void)friendsRecomment
{
    YXLogFunc;
}

- (IBAction)loginRegisterBtnClick
{
    [self presentViewController:[YXLoginRegisterViewController new] animated:true completion:nil];
}


@end
