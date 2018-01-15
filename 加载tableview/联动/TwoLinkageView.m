//
//  TwoLinkageView.m
//  加载tableview
//
//  Created by slcf888 on 2018/1/12.
//  Copyright © 2018年 slcf888. All rights reserved.
//

#import "TwoLinkageView.h"
#define leftTableWidth  [UIScreen mainScreen].bounds.size.width * 0.3
#define rightTableWidth [UIScreen mainScreen].bounds.size.width * 0.7
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height

#define leftCellIdentifier @"leftCellIdentifier"
#define rightCellIdentifier @"rightCellIdentifier"

@interface TwoLinkageView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *leftTableview;
@property (nonatomic,weak) UITableView *rightTableview;

@end

@implementation TwoLinkageView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.leftTableview];
    [self.view addSubview:self.rightTableview];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView ==self.leftTableview) {
        return 40;
    }
    return 8;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView ==self.leftTableview) {
        return 1;
    }
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    // 左边的view
    if (tableView ==self.leftTableview) {
        cell =[tableView dequeueReusableCellWithIdentifier:leftCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text =[NSString stringWithFormat:@"%ld",indexPath.row];
        
        //右边的 view
    }else{
        cell =[tableView dequeueReusableCellWithIdentifier:rightCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text =[NSString stringWithFormat:@"第%ld组-第%ld行",indexPath.section,indexPath.row];
    }
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView ==self.rightTableview) {
        return [NSString stringWithFormat:@"%ld",section];
    }
    return nil;
}
#pragma mark -delegate

//MARK:一个方法就能搞定，右边滑动时跟左边联动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 如果是 左侧的 tableview直接return
    if (scrollView ==self.leftTableview) return;
    // 取出显示在视图 且最靠上的cell的indexpath
    NSIndexPath *topHeaderViewIndexpath = [[self.rightTableview indexPathsForVisibleRows] firstObject];
    //左侧tableview移动的indexpath
    NSIndexPath *moveToIndexpath =[NSIndexPath indexPathForRow:topHeaderViewIndexpath.section inSection:0];
    //移动左侧tableview到指定indexpath剧中显示
    [self.leftTableview selectRowAtIndexPath:moveToIndexpath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}
//MARK: 点击cell的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 选中左侧的tableview
    if (tableView ==self.leftTableview) {
        NSIndexPath *moveToIndexpath =[NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        // 将右侧tableview移动到指定位置
        [self.rightTableview selectRowAtIndexPath:moveToIndexpath animated:YES scrollPosition:UITableViewScrollPositionTop];
        // 取消选中效果
        [self.rightTableview deselectRowAtIndexPath:moveToIndexpath animated:YES];
    }
}
#pragma mark -懒加载
- (UITableView *)leftTableview{
    if (!_leftTableview) {
        UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, leftTableWidth, ScreenHeight) style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        _leftTableview =tableView;
        tableView.dataSource =self;
        tableView.delegate =self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:leftCellIdentifier];
//        tableView.backgroundColor =[UIColor redColor];
        tableView.tableFooterView =[UIView new];
    }
    return _leftTableview;
}
- (UITableView *)rightTableview {
    
    if (!_rightTableview) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(leftTableWidth, 0, rightTableWidth, ScreenHeight)];
        
        [self.view addSubview:tableView];
        
        _rightTableview = tableView;
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:rightCellIdentifier];
//        tableView.backgroundColor = [UIColor cyanColor];
        tableView.tableFooterView = [[UIView alloc] init];
        
    }
    return _rightTableview;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
