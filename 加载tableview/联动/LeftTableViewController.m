//
//  LeftTableViewController.m
//  TableVIew联动
//
//  Created by lisonglin on 17/08/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LeftTableViewController.h"
#import "RightViewController.h"

#define UIScreenHeight  ([UIScreen mainScreen].bounds.size.height - 64)

@interface LeftTableViewController ()<UITableViewDelegate,UITableViewDataSource, RightViewControllerDelegate>

@property(nonatomic, strong) RightViewController * rightVC;
@property(nonatomic, strong) UITableView * leftTableView;
//选中的前面的高度和
@property(nonatomic, assign) CGFloat selectedHeight;



@end

@implementation LeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.translucent = NO;
//    self.hidesBottomBarWhenPushed = YES;
    
    [self createTableView];
    [self createRightVC];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rightTableViewSelectedCell:) name:@"SelectedCell" object:nil];
    
    self.selectedHeight = 0;
}

- (void)createTableView {
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, self.view.frame.size.height ) style:UITableViewStylePlain];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.leftTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.leftTableView];
}

- (void)createRightVC {
    self.rightVC = [[RightViewController alloc] init];
    [self addChildViewController:self.rightVC];
    self.rightVC.delegate = self;
    [self.view addSubview:self.rightVC.view];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellID = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld类",indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.rightVC) {
        [self.rightVC scrollToSelectedIndexPath:indexPath];
    }
    
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.selectedHeight = 20 * 44;
    
    CGFloat offsetY = cell.center.y - UIScreenHeight / 2;
    CGFloat maxOffsetY = 20 * 44 - UIScreenHeight;
    
    if (offsetY < 0 || maxOffsetY < 0) {
        offsetY = 0;
    }else if (offsetY > maxOffsetY) {
        offsetY = maxOffsetY;
    }
    
    [self.leftTableView setContentOffset:CGPointMake(0, offsetY) animated:YES];

}


- (void)willDisplayHeaderView:(NSInteger)section {
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}


- (void)didEndDisplayHeaderView:(NSInteger)section {
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section + 1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}



- (void)rightTableViewSelectedCell:(NSNotification *)obj {
    
    NSInteger index = [obj.userInfo[@"section"] integerValue];
    
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
