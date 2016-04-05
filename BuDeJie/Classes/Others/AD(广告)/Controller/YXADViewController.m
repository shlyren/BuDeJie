//
//  YXADViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/2.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXADViewController.h"
#import "YXTabBarController.h"
#import "YXRequestData.h"
#import "YXADItem.h"
#import "UIImageView+WebCache.h"

@interface YXADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *AdView;
@property (nonatomic, weak) UIImageView *adImgView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@property (nonatomic, strong) YXADItem *adItem;

@property (nonatomic, weak) NSTimer *timer;

@end

@implementation YXADViewController

- (UIImageView *)adImgView
{
    if (_adImgView == nil) {
        UIImageView *adImgView = [[UIImageView alloc] initWithFrame:self.AdView.bounds];
        adImgView.userInteractionEnabled = true;
        [self.AdView addSubview:adImgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [adImgView addGestureRecognizer:tap];
        
        _adImgView = adImgView;
    }
    return _adImgView;
}

#pragma mark - initial
#pragma mark view
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpLaunchImage];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timer:) userInfo:nil repeats:true];
    
    [self loadData];
    
}
- (void)setUpLaunchImage
{
    UIImage *image = nil;
    if (iPhone4sOriPhone4)           image = [UIImage imageNamed:@"LaunchImage-700.png"];
    if (iPhone5sOriPhone5cOriPhone5) image = [UIImage imageNamed:@"LaunchImage-568h.png"];
    if (iPhone6sOriPhone6)           image = [UIImage imageNamed:@"LaunchImage-800-667h.png"];
    if (iPhone6sPlusOriPhone6Plus)   image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x.png"];
    
    self.imageView.image = image;
}

#pragma mark data
- (void)loadData
{
    __weak typeof(self) weakSelf = self;
    
    [YXRequestData requestAdSuccess:^(YXADItem *adItem) {
        
        if (adItem)
        {
            _adItem = adItem;
            if (adItem.w <= 0) return;
            
            //weakSelf.adImgView.frame = CGRectMake(0, 0, YXScreenWidth, YXScreenWidth / adItem.w * adItem.h);
            
            [weakSelf.adImgView sd_setImageWithURL:[NSURL URLWithString:adItem.w_picurl]];
        }
        
    } failure:nil];
}

- (void)tap
{
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:[NSURL URLWithString:_adItem.ori_curl]]) {
        [app canOpenURL:[NSURL URLWithString:_adItem.ori_curl]];
    }
}

#pragma mark - Methods
- (void)timer:(NSTimer *)timer
{
    static NSInteger time= 3;
    
    if (time == 0) [self jumpBtnClick];
    
    [self.jumpBtn setTitle:[NSString stringWithFormat:@"跳过(%zd)", --time] forState:UIControlStateNormal];
}


- (IBAction)jumpBtnClick
{
    [_timer invalidate];
    _timer = nil;
    [UIApplication sharedApplication].keyWindow.rootViewController = [YXTabBarController new];
}

- (void)dealloc
{
    //YXLog(@"%@", _timer);
}

@end
