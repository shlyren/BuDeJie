//
//  YXEssenceViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXEssenceViewController.h"
#import "UIBarButtonItem+YXItem.h"

@interface YXEssenceViewController ()

@end

@implementation YXEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YXRandomlyColor;
    [self setUpNavigationItem];
}

#pragma mark - initial
- (void)setUpNavigationItem
{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImage:@"nav_item_game_icon" highlightImage:@"nav_item_game_click_icon" target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:@"navigationButtonRandom" highlightImage:@"navigationButtonRandomClick" target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
}

@end
