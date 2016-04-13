//
//  YXMeViewController.m
//  BuDeJie
//
//  Created by 任玉祥 on 16/3/31.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "YXMeViewController.h"
#import "UIBarButtonItem+YXItem.h"
#import "YXSetttingViewController.h"
#import "YXWebViewController.h"
#import "YXMeSquareCell.h"
#import "YXRequestData.h"
#import "YXMeSquareItem.h"

@interface YXMeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>;
@property (nonatomic, strong) NSMutableArray *squareItems;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation YXMeViewController

#define itemWH ((YXScreenWidth - margin * (cols - 1)) / cols)

static NSString *const collectionCellId = @"collectionCellId";

static CGFloat margin = 1;
static NSInteger cols = 4;


#pragma mark - lazy loading
- (NSMutableArray *)squareItems
{
    if (_squareItems == nil) {
        _squareItems = [NSMutableArray array];
    }
    return _squareItems;
}

#pragma mark - initial
#pragma mark initial view
- (instancetype)init
{
    return [[UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil] instantiateInitialViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpNavigationItem];
    [self setUpView];
    [self loadData];
}

- (void)setUpView
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = YXBaseColor;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.scrollsToTop = false;
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YXMeSquareCell class]) bundle:nil] forCellWithReuseIdentifier:collectionCellId];
    _collectionView = collectionView;
    
    self.tableView.tableFooterView = collectionView;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}

- (void)setUpNavigationItem
{
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" selectedImage:@"mine-moon-icon-click" target:self action:@selector(nightIconClick:)];
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click" target:self action:@selector(settingIconClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, nightItem];
    self.navigationItem.title = @"我的";
}

#pragma mark data
- (void)loadData
{
    __weak typeof (self) weakSelf = self;
    
    [YXRequestData requestMeSquareSuccess:^(NSArray *squares) {
        if (squares.count)
        {
            [weakSelf.squareItems addObjectsFromArray:squares];
            [weakSelf resolveData];
            [_collectionView reloadData];
            
            NSInteger rows = (squares.count - 1) / cols + 1;
            _collectionView.height = (itemWH + margin) * rows - margin;
        
            weakSelf.tableView.tableFooterView = _collectionView;
            [weakSelf.tableView reloadData];
        }
        
    } failure:nil];
}

// 处理数据
- (void)resolveData
{
    // 判断缺几个
    // 3 % 4 = 3 4 - 1 0
    NSInteger extre = self.squareItems.count % cols;
    if (extre)// 补模型
    {
        extre = cols - extre;
        
        for (int i = 0; i < extre; i++)
        {
            [self.squareItems addObject:[YXMeSquareItem new]];
        }
    }
}

#pragma mark - collectionView datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.squareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YXMeSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    
    cell.squareItem = self.squareItems[indexPath.item];
    return cell;
}

#pragma mark - collectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YXMeSquareItem *item = self.squareItems[indexPath.row];
    if (![item.url containsString:@"http:"]) return;
    
    YXWebViewController *webVc = [YXWebViewController new];
    webVc.title = item.name;
    webVc.url = item.url;
    
    [self.navigationController pushViewController:webVc animated:true];
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

#pragma mark - Events
- (void)nightIconClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}

- (void)settingIconClick
{
    [self.navigationController pushViewController:[YXSetttingViewController new] animated:true];
}

@end
