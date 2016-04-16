//
//  YXTopicPictureView.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/15.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTopicPictureView.h"
#import "YXTopicItem.h"
#import "UIImageView+download.h"
#import "YXBigPicutreViewController.h"

@interface YXTopicPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *git_imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *bigImgBtn;

@end

@implementation YXTopicPictureView
- (void)awakeFromNib
{
    self.imageView.userInteractionEnabled = true;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.imageView addGestureRecognizer:tap];
}
- (void)tap
{
    YXBigPicutreViewController *bigPictureVc = [YXBigPicutreViewController new];
    bigPictureVc.topicItem = self.topicItem;
    
    [self.window.rootViewController presentViewController:bigPictureVc animated:true completion:nil];
}


- (void)setTopicItem:(YXTopicItem *)topicItem
{
    _topicItem = topicItem;
    
    self.git_imageView.hidden = !topicItem.is_gif;
    self.bigImgBtn.hidden = !topicItem.isBigPicture;
    
    [self.imageView setImageWithOriginalImageURL:topicItem.image1 thumbnailImageURL:topicItem.image0 placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil || !topicItem.isBigPicture) return;
        
        // 开启图形上下文
        CGFloat imageW = topicItem.middleFrame.size.width;
        CGFloat imageH = topicItem.middleFrame.size.height;
        UIGraphicsBeginImageContext(CGSizeMake(imageW, imageH));
        
        // 绘图
        [image drawInRect:CGRectMake(0, 0, imageW, imageW * topicItem.height / topicItem.width)];
        
        // 获得图片
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        // 关闭图形上下文
        UIGraphicsEndImageContext();
    }];
}

@end

