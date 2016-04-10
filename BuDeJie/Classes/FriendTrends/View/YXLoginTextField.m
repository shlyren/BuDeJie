//
//  YXLoginTextField.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/6.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXLoginTextField.h"
#import "UITextField+placeholder.h"

@implementation YXLoginTextField

- (void)awakeFromNib
{
    self.tintColor = [UIColor whiteColor];
    
    [self addTarget:self action:@selector(textBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textEndEditing) forControlEvents:UIControlEventEditingDidEnd];
    
    self.placeholderColor = [UIColor lightGrayColor];
    
//    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
//    placeholderLabel.textColor = [UIColor lightGrayColor];
   
}

- (void)textBeginEditing
{
    self.placeholderColor = [UIColor whiteColor];
//    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
//    placeholderLabel.textColor = [UIColor whiteColor];
}

- (void)textEndEditing
{
    self.placeholderColor = [UIColor lightGrayColor];
//    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
//    placeholderLabel.textColor = [UIColor lightGrayColor];
}

@end
