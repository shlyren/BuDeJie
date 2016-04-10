//
//  YXFileManager.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/6.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXFileManager.h"

@implementation YXFileManager

+ (NSInteger)getDirectorySize:(NSString *)dirPath
{
   
    // 获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:dirPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) // 报错:抛异常
    {
        [[NSException exceptionWithName:@"filePathError" reason:@"文件路径无效,请传入全路径的文件夹路径" userInfo:nil] raise];
    }
    
    /*
     获取这个文件夹中所有文件路径,然后累加 = 文件夹的尺寸
     */
    
    // 获取文件夹下所有的文件
    NSArray *subpaths = [mgr subpathsAtPath:dirPath];
    NSInteger totalSize = 0;
    
    for (NSString *subpath in subpaths)
    {
        // 拼接文件全路径
        NSString *filePath = [dirPath stringByAppendingPathComponent:subpath];
        
        // 排除文件夹
        BOOL isDirectory;
        BOOL isExist = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
        if (!isExist || isDirectory) continue;
        
        // 隐藏文件
        if ([filePath containsString:@".DS"]) continue;
        
        // 指定路径获取这个路径的属性
        // attributesOfItemAtPath:只能获取文件属性
        NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
        totalSize += [attr fileSize];
    }
    
    return totalSize;
    

}

+ (void)removeSubDirectoryWithDirPath:(NSString *)dirPath
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:dirPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory)   // 报错:抛异常
    {
        [[NSException exceptionWithName:@"filePathError" reason:@"文件路径无效,请传入全路径的文件夹路径" userInfo:nil] raise];
    }
    
    NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];
    
    for (NSString *subPath in subpaths)
    {
        NSString *filePath = [dirPath stringByAppendingPathComponent:subPath];
        
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}

@end
