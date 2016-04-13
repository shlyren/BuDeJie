//
//  YXTopicViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/9.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXTopicViewController.h"
#import "YXTopicCell.h"
#import "UITableView+Extension.h"
#import "SVProgressHUD.h"

@interface YXTopicViewController ()

@property (nonatomic, strong) NSString *maxtime;
@property (nonatomic, strong) NSMutableArray *topicItems;
@end

@implementation YXTopicViewController
static NSString *const topicId = @"topicId";


- (YXTopicType)type
{
    return YXTopicTypeAll;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupView];

}

- (void)setupView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = YXBaseColor;
    self.tableView.contentInset = UIEdgeInsetsMake(YXNavBarMaxY + YXTitleViewH + YXBaseMargin, 0, YXTabBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YXTopicCell class]) bundle:nil] forCellReuseIdentifier:topicId];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_header.automaticallyChangeAlpha = true;
    [self.tableView.mj_header beginRefreshing];
}


- (NSString *)list
{
    return @"list";
}

- (void)loadData
{
    NSDictionary *dict = @{
                           @"a" : self.list,
                           @"c" : @"data",
                           @"type" : @(self.type)
                           };
    
    __weak typeof (self) weakSelf = self;
    [YXRequestData requestTopicParemeters:dict success:^(YXRootItem *rootItem) {
        if (rootItem) {
            weakSelf.maxtime = rootItem.info.maxtime;
            weakSelf.topicItems = (NSMutableArray *)rootItem.list;
            [weakSelf.tableView reloadData];
        }
        [weakSelf.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreData
{
    if (self.tableView.mj_header.isRefreshing) {
        [SVProgressHUD showErrorWithStatus:@"正在加载中"];
        return;
    }
       NSDictionary *dict = @{
                           @"a" : @"list",
                           @"c" : @"data",
                           @"type" : @(self.type),
                           @"maxtime" : self.maxtime
                           };
    __weak typeof (self) weakSelf = self;
    [YXRequestData requestTopicParemeters:dict success:^(YXRootItem *rootItem) {
        if (rootItem) {
            weakSelf.maxtime = rootItem.info.maxtime;
            [weakSelf.topicItems addObjectsFromArray:rootItem.list];
            [weakSelf.tableView reloadData];
        }
        [weakSelf.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
}


#pragma mark - tableView data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topicItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView tableViewSetExtraCellLineHidden];
    YXTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:topicId];
    cell.topicItem = self.topicItems[indexPath.row];
    
    return cell;
}

#pragma mark - tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.topicItems[indexPath.row] rowHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)endRefreshing
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

@end
