//
//  YXSubscribeTagCell.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXSubscribeTagCell.h"
#import "YXSubscribeTagItem.h"
#import "UIImageView+WebCache.h"
#import "UIImage+image.h"

@interface YXSubscribeTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation YXSubscribeTagCell



- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSubTagItem:(YXSubscribeTagItem *)subTagItem
{
    _subTagItem = subTagItem;
    
    self.nameLabel.text = subTagItem.theme_name;
    
    UIImage *placeImage = [UIImage imageNamed:@"defaultUserIcon"];

    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:subTagItem.image_list] placeholderImage:[placeImage circleImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil) return;
        
        _iconImgView.image = [image circleImage];
        
    }];
    
    if (subTagItem.sub_number.length < 5) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%@人已订阅", subTagItem.sub_number];
        return;
    }
    
    NSString *numberStr = [NSString stringWithFormat:@"%.1f万人已订阅",subTagItem.sub_number.integerValue / 10000.0];
    self.subNumberLabel.text = [numberStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    
}

- (void)setFrame:(CGRect)frame
{
    
    frame.size.height -= 1;
    
    [super setFrame:frame];
}

@end
