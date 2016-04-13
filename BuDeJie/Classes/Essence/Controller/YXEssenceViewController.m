//
//  YXEssenceViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXEssenceViewController.h"
#import "UIBarButtonItem+YXItem.h"

#import "YXTitleViewButton.h"
#import "YXAllViewController.h"
#import "YXVideoViewController.h"
#import "YXVoiceViewController.h"
#import "YXPictureViewController.h"
#import "YXWordViewController.h"

@interface YXEssenceViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, weak) YXTitleViewButton *preTitleBtn;

@property (nonatomic, weak) UIView *titlesLineView;

@property (nonatomic, weak) UIView *titlesView;

@end

@implementation YXEssenceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
     _titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self setUpNavigationItem];
    
    [self setupAllChidlViewController];
    
    [self setupView];
}

#pragma mark - initial
#pragma mark 初始化view
- (void)setupView
{
    
    // scrollView
    {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        scrollView.contentSize = CGSizeMake(_titles.count * YXScreenWidth, 0);
        scrollView.delegate = self;
        scrollView.pagingEnabled = true;
        scrollView.scrollsToTop = false;
        scrollView.showsVerticalScrollIndicator = false;
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.backgroundColor = YXBaseColor;
        [self.view addSubview:_scrollView = scrollView];
    }
    
    // titleView
    {
        UIView *titlesView = [[UIView alloc] initWithFrame:CGRectMake(0, YXNavBarMaxY, YXScreenWidth, YXTitleViewH)];
        titlesView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
        [self.view addSubview: _titlesView = titlesView];
    }
    
    // title
    {
        CGFloat titleButtonW = YXScreenWidth / _titles.count;
        for (NSInteger i = 0; i < _titles.count; i++)
        {
            YXTitleViewButton *titleButton = [YXTitleViewButton new];
            titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, YXTitleViewH);
            titleButton.tag = i;
            [titleButton setTitle:_titles[i] forState:UIControlStateNormal];
            [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.titlesView addSubview:titleButton];
            
            if (i == 0) [self titleButtonClick:titleButton];
        }
    }
    
     // titleLineView
    {
        CGFloat titleLineViewH = 2;
        CGFloat titleLineViewY = YXTitleViewH - titleLineViewH;
        
        UIView *titlesLineView = [UIView new];
        titlesLineView.backgroundColor = [_preTitleBtn titleColorForState:UIControlStateSelected];
        titlesLineView.frame = CGRectMake(0, titleLineViewY, 0, titleLineViewH);
        [self.titlesView addSubview:_titlesLineView = titlesLineView];
        
        [_preTitleBtn.titleLabel sizeToFit];
        titlesLineView.width = _preTitleBtn.titleLabel.width;
        titlesLineView.centerX = _preTitleBtn.width * 0.5;
    }
    
}

- (void)setupAllChidlViewController
{
    [self addChildViewController:[YXAllViewController new]];
    [self addChildViewController:[YXVideoViewController new]];
    [self addChildViewController:[YXVoiceViewController new]];
    [self addChildViewController:[YXPictureViewController new]];
    [self addChildViewController:[YXWordViewController new]];
}


#pragma mark - scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //if (index > self.titlesView.subviews.count - 1) return;
    [self titleButtonClick:self.titlesView.subviews[index]];
}

#pragma mark - Events
- (void)titleButtonClick:(YXTitleViewButton *)titleButton
{
    if (self.preTitleBtn == titleButton) return;
    
    self.preTitleBtn.selected = false;
    titleButton.selected = true;
    self.preTitleBtn = titleButton;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.titlesLineView.centerX = titleButton.centerX;
        self.titlesLineView.width = titleButton.titleLabel.width;
        
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = titleButton.tag * self.scrollView.width;
        self.scrollView.contentOffset = offset;
        
    } completion:^(BOOL finished) {
        // 懒加载
        UIViewController *childVc = self.childViewControllers[titleButton.tag];
        childVc.view.frame = self.scrollView.bounds;
        [self.scrollView addSubview:childVc.view];
        
    }];
    
    // 设置滚动到顶部
    for (NSInteger i = 0; i < self.childViewControllers.count; i++)
    {
        UIViewController *childVc = self.childViewControllers[i];
        if (!childVc.isViewLoaded) continue;
        if ([childVc.view isKindOfClass:[UIScrollView class]])
        {
            UIScrollView *scrollView = (UIScrollView *)childVc.view;
            scrollView.scrollsToTop = i == titleButton.tag;
        }
    }
}

#pragma mark - 初始化导航栏按钮
- (void)setUpNavigationItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_item_game_icon"
                                                            highlightImage:@"nav_item_game_click_icon"
                                                                    target:nil
                                                                    action:nil];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationButtonRandom"
                                                             highlightImage:@"navigationButtonRandomClick"
                                                                     target:nil
                                                                     action:nil];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
@end
