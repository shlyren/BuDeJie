//
//  UIImage+image.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
/**
 *  根据一张图片返回一个裁剪后的image
 *
 *  @return 裁剪后的image
 */
- (UIImage *)circleImage;
@end
