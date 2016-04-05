//
//  UITableView+Extension.m
//  tableView扩展
//
//  Created by 任玉祥 on 16/3/9.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

/**
 *  通过tableViewDataSource来判断当没有数据时,去掉tableviewCell的分割线，并在tableview上显示一些信息
 *
 *  @param message 显示的内容
 *  @param count   row的个数
 */
- (void)tableViewShowMessage:(NSString *)message numberOfRows:(NSInteger)rowCount;
{
    if (!rowCount)
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        UILabel *backLabel = [[UILabel alloc] init];
        backLabel.text = message;
        backLabel.textColor = [UIColor lightGrayColor];
        backLabel.textAlignment = NSTextAlignmentCenter;
        [backLabel sizeToFit];
        
        self.backgroundView = backLabel;
        
    }
    else
    {
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
}

/**
 *  隐藏tableViewCell多余的分割线
 */
- (void)tableViewSetExtraCellLineHidden
{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self setTableFooterView:view];
    
}
@end
