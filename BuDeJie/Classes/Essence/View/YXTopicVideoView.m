//
//  YXTopicVideoView.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/15.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTopicVideoView.h"
#import "UIImageView+WebCache.h"
#import "YXTopicItem.h"
#import "YXBigPicutreViewController.h"

@interface YXTopicVideoView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *videotimeLabel;

@end


@implementation YXTopicVideoView

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
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topicItem.image1]];
    
    self.videotimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", topicItem.voicetime / 60, topicItem.voicetime % 60];
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd", topicItem.playcount];
    if (topicItem.playcount < 10000 ) return;
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%.1f万次播放", topicItem.playcount / 10000.0];
    
}
@end
