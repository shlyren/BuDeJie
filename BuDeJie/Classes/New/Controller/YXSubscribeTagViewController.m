//
//  YXSubscribeTagViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/5.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXSubscribeTagViewController.h"
#import "YXRequestData.h"
#import "YXSubscribeTagCell.h"
#import "SVProgressHUD.h"

@interface YXSubscribeTagViewController ()

@property (nonatomic, strong) NSArray *subTags;

@end

@implementation YXSubscribeTagViewController
static NSString *subTagCell = @"subTagCell";

- (instancetype)init
{
    return [[UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil] instantiateInitialViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"推荐标签";
    [self loadData];
}

- (void)loadData
{
    [SVProgressHUD show];
    [YXRequestData requestSubTagsSuccess:^(NSArray *subTags) {
        if (subTags.count) {
            _subTags = subTags;
            [self.tableView reloadData];
        }
    } failure:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _subTags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXSubscribeTagCell *cell = [tableView dequeueReusableCellWithIdentifier:subTagCell];
    
    cell.subTagItem = self.subTags[indexPath.row];
    
    return cell;
}



@end
