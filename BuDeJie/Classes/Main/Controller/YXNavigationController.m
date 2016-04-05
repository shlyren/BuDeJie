//
//  YXNavigationController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXNavigationController.h"
#import "SVProgressHUD.h"

@interface YXNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation YXNavigationController


+ (void)load
{
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [navBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
    self.interactivePopGestureRecognizer.enabled = false;
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count)
    {
        viewController.hidesBottomBarWhenPushed = true;
        viewController.navigationItem.leftBarButtonItem = self.setUpBackBarBtn;
    }
    
    [super pushViewController:viewController animated:animated];
}


- (UIBarButtonItem *)setUpBackBarBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    [btn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


- (void)popViewController
{
    [self popViewControllerAnimated:true];
    [SVProgressHUD dismiss];
}



#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count - 1;
}

- (void)handleNavigationTransition:(UIPanGestureRecognizer *)pan{}
@end
