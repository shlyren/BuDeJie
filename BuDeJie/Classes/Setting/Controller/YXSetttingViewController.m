//
//  YXSetttingViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/2.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXSetttingViewController.h"
#import "UITableView+Extension.h"
#import "YXFileManager.h"
#import "SVProgressHUD.h"

#define filePath NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true)[0]
@interface YXSetttingViewController ()

@end

@implementation YXSetttingViewController

static NSString *const settingCellId = @"settingCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:settingCellId];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingCellId forIndexPath:indexPath];
    [tableView tableViewSetExtraCellLineHidden];
    
    cell.textLabel.text = self.fileSizeStr;
    
    return cell;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    [YXFileManager removeSubDirectoryWithDirPath:filePath];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showSuccessWithStatus:@"清除成功"];
    
    [tableView reloadData];
}

- (NSString *)fileSizeStr
{
    NSInteger totalSize = [YXFileManager getDirectorySize:filePath];
    
    NSString *str = @"清除缓存";
    
    if (totalSize > 1000 * 1000)// MB
    {
        CGFloat totalSizeF = totalSize / 1000.0 / 1000.0;
        return [NSString stringWithFormat:@"%@(%.1fMB)",str,totalSizeF];
    }
    else if (totalSize > 1000)  // KB
    {
        CGFloat totalSizeF = totalSize / 1000.0;
        return [NSString stringWithFormat:@"%@(%.1fKB)",str,totalSizeF];
    }
    else if (totalSize > 0)// B
    {
        return [NSString stringWithFormat:@"%@(%ldB)",str,totalSize];
    }
    
    return str;
}

@end
