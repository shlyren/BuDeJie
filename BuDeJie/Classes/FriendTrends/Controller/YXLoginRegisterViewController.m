//
//  YXLoginRegisterViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXLoginRegisterViewController.h"
#import "YXLoginRegisterView.h"
@interface YXLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginRegisterView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginRegisterLeading;

@end

@implementation YXLoginRegisterViewController

#pragma mark - initial
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.loginRegisterView addSubview:[YXLoginRegisterView loginView]];
    [self.loginRegisterView addSubview:[YXLoginRegisterView registerView]];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _loginRegisterView.subviews[0].frame = CGRectMake(0, 0, YXScreenWidth, _loginRegisterView.height);
    _loginRegisterView.subviews[1].frame = CGRectMake(YXScreenWidth, 0, YXScreenWidth, _loginRegisterView.height);
}

#pragma mark - Events
- (IBAction)loginOrRegisterBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;

    _loginRegisterLeading.constant = sender.selected ? -YXScreenWidth : 0;
    [UIView animateWithDuration:0.15 animations:^{
       
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)close
{
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
