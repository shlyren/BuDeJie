//
//  UIImageView+download.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/16.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIImageView+download.h"
#import "AFNetworking.h"


@implementation UIImageView (download)
- (void)setImageWithOriginalImageURL:(NSString *)originalImageURL thumbnailImageURL:(NSString *)thumbnailImageURL placeholderImage:(UIImage *)placeholderImage completed:(SDWebImageCompletionBlock)completedBlock
{
    // 从内存\沙盒缓存中获得原图
    UIImage *originalImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:originalImageURL];
    if (originalImage) { // 如果内存\沙盒缓存有原图，那么就直接显示原图（不管现在是什么网络状态）
        [self sd_setImageWithURL:[NSURL URLWithString:originalImageURL] completed:completedBlock];
    } else { // 内存\沙盒缓存没有原图
        AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
        if (mgr.isReachableViaWiFi) { // 在使用Wifi, 下载原图
            [self sd_setImageWithURL:[NSURL URLWithString:originalImageURL] placeholderImage:placeholderImage completed:completedBlock];
        } else if (mgr.isReachableViaWWAN) { // 在使用手机自带网络
            //     用户的配置项假设利用NSUserDefaults存储到了沙盒中
            //    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"alwaysDownloadOriginalImage"];
            //    [[NSUserDefaults standardUserDefaults] synchronize];
#warning 从沙盒中读取用户的配置项：在3G\4G环境是否仍然下载原图
            BOOL alwaysDownloadOriginalImage = [[NSUserDefaults standardUserDefaults] boolForKey:@"alwaysDownloadOriginalImage"];
            if (alwaysDownloadOriginalImage) { // 下载原图
                [self sd_setImageWithURL:[NSURL URLWithString:originalImageURL] placeholderImage:placeholderImage completed:completedBlock];
            } else { // 下载小图
                [self sd_setImageWithURL:[NSURL URLWithString:thumbnailImageURL] placeholderImage:placeholderImage completed:completedBlock];
            }
        } else { // 没有网络
            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:thumbnailImageURL];
            if (thumbnailImage) { // 内存\沙盒缓存中有小图
                [self sd_setImageWithURL:[NSURL URLWithString:thumbnailImageURL] completed:completedBlock];
            } else {
                [self sd_setImageWithURL:nil placeholderImage:placeholderImage completed:completedBlock];
            }
        }
    }
}
@end
