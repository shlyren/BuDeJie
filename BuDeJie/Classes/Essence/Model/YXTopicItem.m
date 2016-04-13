//
//  YXTopicItem.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/13.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTopicItem.h"



@implementation YXTopicItem

- (CGFloat)rowHeight
{
    
    if (_rowHeight) return _rowHeight;
    
    _rowHeight = YXBaseMargin + 40 + YXBaseMargin;
    
    _rowHeight += [self.text boundingRectWithSize:CGSizeMake(YXScreenWidth - 2 * YXBaseMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : YXBaseFont} context:nil].size.height + YXBaseMargin;
    
    
    
    
    if (_top_cmt.count) {
        YXTopicTopCmtItem *topCmtItem = _top_cmt.firstObject;
        
        topCmtItem.content = topCmtItem.content ? topCmtItem.content : @"[语音消息]";
        NSString *content = [NSString stringWithFormat:@"%@: %@",topCmtItem.user.username, topCmtItem.content];

        _rowHeight += 20;
        _rowHeight += [content boundingRectWithSize:CGSizeMake(YXScreenWidth - 2 * YXBaseMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : YXBaseFont} context:nil].size.height;
    }
    
    _rowHeight += 40 + YXBaseMargin;
//    YXLog(@"%f", _rowHeight);
    return _rowHeight;
}

@end
