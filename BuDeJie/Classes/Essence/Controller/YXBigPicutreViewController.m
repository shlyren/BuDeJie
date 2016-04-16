//
//  YXBigPicutreViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/16.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXBigPicutreViewController.h"
#import "YXTopicItem.h"
#import "UIImageView+WebCache.h"
#import "SVProgressHUD.h"


@interface YXBigPicutreViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation YXBigPicutreViewController


- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        scrollView.delegate = self;
        [scrollView addGestureRecognizer:tap];
        
        [self.view insertSubview:_scrollView = scrollView atIndex:0];
    }

    return _scrollView;
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [UIImageView new];
    
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topicItem.image1] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.saveButton.enabled = image;
    
        imageView.width = self.scrollView.width;
        imageView.x = 0;
        
        [self.scrollView addSubview:_imageView = imageView];
        
        imageView.height = self.topicItem.height / self.topicItem.width * imageView.width;
        
        if (imageView.height >= YXScreenHeight) {
            imageView.y = 0;
            self.scrollView.contentSize = imageView.frame.size;
        }else{
            imageView.centerY = YXScreenHeight * 0.5;
        }
        
        CGFloat maxScale = self.topicItem.width / imageView.width;
        if (maxScale > 1.0) {
            self.scrollView.maximumZoomScale = maxScale;
        }
        
        

    }];
    
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (IBAction)saveBtnClick
{

}

- (IBAction)close
{
    
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
