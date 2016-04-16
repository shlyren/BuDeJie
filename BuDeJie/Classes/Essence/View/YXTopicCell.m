//
//  YXTopicCell.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/13.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTopicCell.h"
#import "YXTopicItem.h"
#import "YXTopicVideoView.h"
#import "YXTopicVoiceView.h"
#import "YXTopicPictureView.h"
#import "UIImageView+WebCache.h"

@interface YXTopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIView *topCmtCoverView;

@property (weak, nonatomic) IBOutlet UILabel *topCmtContentLabel;


@property (nonatomic, weak) YXTopicVideoView *videoView;
@property (nonatomic, weak) YXTopicVoiceView *voiceView;
@property (nonatomic, weak) YXTopicPictureView *pictureView;

@end

@implementation YXTopicCell

- (YXTopicVideoView *)videoView
{
    if (_videoView == nil) {
        
        [self.contentView addSubview:_videoView = [YXTopicVideoView viewFromNib]];
    }
    return _videoView;
}

- (YXTopicVoiceView *)voiceView
{
    if (_voiceView == nil) {
        [self.contentView addSubview:_voiceView = [YXTopicVoiceView viewFromNib]];
    }
    return _voiceView;
}

- (YXTopicPictureView *)pictureView
{
    if (_pictureView == nil) {
        [self.contentView addSubview:_pictureView = [YXTopicPictureView viewFromNib]];
    }
    return _pictureView;
}

- (void)awakeFromNib
{
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopicItem:(YXTopicItem *)topicItem
{
    _topicItem = topicItem;
    
    [self.profileImgView sd_setImageWithURL:[NSURL URLWithString:topicItem.profile_image] placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
    self.nameLabel.text = topicItem.name;
    self.passTimeLabel.text = topicItem.passtime;
    self.text_label.text = topicItem.text;
    
    [self setupButton:self.dingButton number:topicItem.ding placeText:@"顶"];
    [self setupButton:self.caiButton number:topicItem.cai placeText:@"踩"];
    [self setupButton:self.repostButton number:topicItem.repost placeText:@"分享"];
    [self setupButton:self.commentButton number:topicItem.comment placeText:@"评论"];
    
    
    
    if (self.topicItem.top_cmt.count) {
        YXTopicTopCmtItem *topCmtItem = self.topicItem.top_cmt.firstObject;
        self.topCmtCoverView.hidden = false;
        
        if (topCmtItem.content.length == 0) {
            topCmtItem.content = @"[语音消息]";
        }
        self.topCmtContentLabel.text = [NSString stringWithFormat:@"%@: %@",topCmtItem.user.username, topCmtItem.content];
    
    } else{
    
        self.topCmtCoverView.hidden = true;
        
    }
    
    switch (topicItem.type)
    {
        case YXTopicTypeWord:
        {
            self.voiceView.hidden = true;
            self.videoView.hidden = true;
            self.pictureView.hidden = true;
            break;
        }
            
        case YXTopicTypeVideo:
        {
            self.videoView.topicItem = topicItem;
            self.voiceView.hidden = true;
            self.videoView.hidden = false;
            self.pictureView.hidden = true;
            break;
        }
            
        case YXTopicTypeVoice:
        {
            self.voiceView.topicItem = topicItem;
            self.voiceView.hidden = false;
            self.videoView.hidden = true;
            self.pictureView.hidden = true;
            break;
        }
            
        case YXTopicTypePicture:
        {
            self.pictureView.topicItem = topicItem;
            self.voiceView.hidden = true;
            self.videoView.hidden = true;
            self.pictureView.hidden = false;
            break;
        }
        default:break;
    }
    
    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    switch (self.topicItem.type)
    {
        case YXTopicTypeVideo:
        {
            self.videoView.frame = self.topicItem.middleFrame;
            break;
        }
            
        case YXTopicTypeVoice:
        {
            self.voiceView.frame = self.topicItem.middleFrame;
            break;
        }
            
        case YXTopicTypePicture:
        {
            self.pictureView.frame = self.topicItem.middleFrame;
            break;
        }
        default: break;
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    
    [super setFrame:frame];
}
- (void)setupButton:(UIButton *)btn number:(NSInteger)num placeText:(NSString *)placeText
{
    if (num >= 10000) {
        [btn setTitle:[NSString stringWithFormat:@"%.1f万", num / 10000.0] forState:UIControlStateNormal];
    }else if (num == 0) {
        [btn setTitle:placeText forState:UIControlStateNormal];
    }else {
        [btn setTitle:[NSString stringWithFormat:@"%zd", num] forState:UIControlStateNormal];
    }
}

@end
