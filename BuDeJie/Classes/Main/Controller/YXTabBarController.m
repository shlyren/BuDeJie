//
//  YXTabBarController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTabBarController.h"
#import "YXNavigationController.h"
#import "YXEssenceViewController.h"
#import "YXFriendTrendsViewController.h"
#import "YXMeViewController.h"
#import "YXNewViewController.h"
#import "YXPublishViewController.h"

@interface YXTabBarController ()

@end

@implementation YXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
}


#pragma mark - Methods
// 添加全部控制器
- (void)setUpAllChildViewController
{
    // 精华
    [self setUpOneViewController:[YXEssenceViewController new]
                           title:@"精华"
                           image:@"tabBar_essence_icon"
                   selectedImage:@"tabBar_essence_click_icon"];
    
    
    // 新帖
    [self setUpOneViewController:[YXNewViewController new]
                           title:@"新帖"
                           image:@"tabBar_new_icon"
                   selectedImage:@"tabBar_new_click_icon"];
    
    // 发布
    [self setUpOneViewController:[YXPublishViewController new]
                           title:nil
                           image:@"tabBar_publish_icon"
                   selectedImage:@"tabBar_publish_click_icon"];

    // 关注
    [self setUpOneViewController:[YXFriendTrendsViewController new]
                           title:@"关注"
                           image:@"tabBar_friendTrends_icon"
                           selectedImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    [self setUpOneViewController:[YXMeViewController new]
                           title:@"我"
                           image:@"tabBar_me_icon"
                   selectedImage:@"tabBar_me_click_icon"];

}

/**
 *  添加一个控制器
 *
 *  @param vc                控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中图片
 */
- (void)setUpOneViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName
{
    // 标题
    vc.tabBarItem.title = title;
    // 图片
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 选中图片
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 如果是发布控制器, 没有导航控制器
    if ([vc isKindOfClass:[YXPublishViewController class]])
    {
        [self addChildViewController:vc];
        
    }else{

        [self addChildViewController:[[YXNavigationController alloc] initWithRootViewController:vc]];
    }
    
    
}
@end
