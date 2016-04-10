//
//  YXWebViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/6.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXWebViewController.h"
#import <WebKit/WebKit.h>

@interface YXWebViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, weak) WKWebView *webView;
@end

@implementation YXWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    
    [self.view insertSubview:webView atIndex:0];
    _webView = webView;
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    _progressView.progress = _webView.estimatedProgress;
    _progressView.hidden = _webView.estimatedProgress >= 1;
}


- (void)dealloc
{
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
