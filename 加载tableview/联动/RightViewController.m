//
//  RightViewController.m
//  TableVIew联动
//
//  Created by lisonglin on 17/08/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "RightViewController.h"
#import "RightDetailViewController.h"
@interface RightViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView * rightTableView;
@property(nonatomic, strong) NSArray * productsArr;
@property(nonatomic, strong) NSArray * sectionArr;
@property(nonatomic, assign) BOOL isScrollUp;
@property(nonatomic, assign) CGFloat lastOffset;

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isScrollUp = NO;
    
    _lastOffset = 0;
    
    [self addDatas];
    
    [self createTableView];
}


- (void)addDatas {
    if (!_productsArr) {
        NSArray * array = @[@"鞋子",@"衣服",@"化妆品",@"饮用水",@"副食品",@"小吃",@"鞋子",@"衣服",@"化妆品",@"饮用水"];
        
        NSMutableArray * a = [NSMutableArray array];
        
        for (int i = 0; i < array.count / 2; i ++) {
            [a addObject:array[arc4random() % (array.count)]];
        }
        _productsArr = [a copy];
    }
}

- (void)createTableView {
//    self.view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.25, 0, self.view.frame.size.width * 0.75, self.view.frame.size.height - 64)];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.25, 0, self.view.frame.size.width * 0.75, self.view.frame.size.height)];

    self.rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    
    [self.view addSubview:self.rightTableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _productsArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"第%ld类",section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellId = @"rightCellID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = self.productsArr[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(willDisplayHeaderView:)] != _isScrollUp && self.rightTableView.isDecelerating) {
        [self.delegate willDisplayHeaderView:section];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didEndDisplayHeaderView:)] && _isScrollUp && self.rightTableView.isDecelerating) {
        [self.delegate didEndDisplayHeaderView:section];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    _isScrollUp = _lastOffset < scrollView.contentOffset.y;
    
    _lastOffset = scrollView.contentOffset.y;
}


- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath {
    [self.rightTableView selectRowAtIndexPath:([NSIndexPath indexPathForRow:0 inSection:indexPath.row]) animated:YES scrollPosition:UITableViewScrollPositionTop];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.rightTableView deselectRowAtIndexPath:indexPath animated:YES];
    //发起通知 lefttableview接收通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectedCell" object:nil userInfo:@{@"section":@(indexPath.section)}];
    
    RightDetailViewController * vc = [[RightDetailViewController alloc] init];
    
    //取到点击的cell
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    vc.title = cell.textLabel.text;
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
