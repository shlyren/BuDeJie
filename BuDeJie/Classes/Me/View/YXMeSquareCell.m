//
//  YXMeSquareCell.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/6.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXMeSquareCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+image.h"
#import "YXMeSquareItem.h"
@interface YXMeSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation YXMeSquareCell

- (void)setSquareItem:(YXMeSquareItem *)squareItem
{
    _squareItem = squareItem;
    
    self.nameLabel.text = squareItem.name;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:squareItem.icon] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        if (image) {
            [image circleImage];
              _iconImageView.image = image;
        }
        
    }];
}

@end
