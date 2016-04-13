//
//  YXAllViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/4/9.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXAllViewController.h"
#import "YXTopicCell.h"

@interface YXAllViewController ()
//
//@property (nonatomic, strong) NSString *maxtime;
//@property (nonatomic, strong) NSMutableArray *topicItems;

@end

@implementation YXAllViewController

//static NSString *const topicId = @"topicId";

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadData];
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YXTopicCell class]) bundle:nil] forCellReuseIdentifier:topicId];
}

- (YXTopicType)type
{
    return YXTopicTypeAll;
}

//- (void)loadData
//{
//    NSDictionary *dict = @{
//                           @"a" : @"list",
//                           @"c" : @"data",
//                           @"type" : @(self.type)
//                           };
//    [YXRequestData requestTopicParemeters:dict success:^(YXRootItem *rootItem) {
//        if (rootItem) {
//            self.maxtime = rootItem.info.maxtime;
//            self.topicItems = (NSMutableArray *)rootItem.list;
//            [self.tableView reloadData];
//        }
//        [self.tableView.mj_header endRefreshing];
//    } failure:^(NSError *error) {
//          [self.tableView.mj_header endRefreshing];
//    }];
//}
//
//- (void)loadMoreData
//{
//    NSDictionary *dict = @{
//                           @"a" : @"list",
//                           @"c" : @"data",
//                           @"type" : @(self.type),
//                           @"maxtime" : self.maxtime
//                           };
//    [YXRequestData requestTopicParemeters:dict success:^(YXRootItem *rootItem) {
//        if (rootItem) {
//            self.maxtime = rootItem.info.maxtime;
//            [self.topicItems addObjectsFromArray:rootItem.list];
//            [self.tableView reloadData];
//        }
//          [self.tableView.mj_footer endRefreshing];
//    } failure:^(NSError *error) {
//          [self.tableView.mj_footer endRefreshing];
//    }];
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.topicItems.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    YXTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:topicId];
//    cell.topicItem = self.topicItems[indexPath.row];
//    
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [self.topicItems[indexPath.row] rowHeight];
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:true];
//}
@end
