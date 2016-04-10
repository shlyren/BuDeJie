//
//  YXFileManager.h
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/6.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXFileManager : NSObject

/**
 *  根据一个文件夹的全路径回去他的大小
 *
 *  @param dirPath 文件夹全路径
 *
 *  @return 文件夹大小
 */
+ (NSInteger)getDirectorySize:(NSString *)dirPath;

/**
 *  根据文件夹的全路径删除他的所有子目录及文件
 *
 *  @param dirPath 文件夹的全路径
 */
+ (void)removeSubDirectoryWithDirPath:(NSString *)dirPath;
@end
