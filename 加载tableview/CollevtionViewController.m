//
//  CollevtionViewController.m
//  加载tableview
//
//  Created by slcf888 on 2018/1/9.
//  Copyright © 2018年 slcf888. All rights reserved.
//

#import "CollevtionViewController.h"
#import "TopScrollerView.h"

#import "TwoLinkageView.h"
#import "LeftTableViewController.h"
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

@interface CollevtionViewController () <TopScrollerViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tabview1;
    UITableView *tabview3;
}
@property (nonatomic, strong) TopScrollerView *topScrollViews;
@end

@implementation CollevtionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    //滑动效果 点击的view
    self.topScrollViews = [TopScrollerView instanceViewWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) titleArr:@[@"tableview1",@"tableview2",@"tableview3"] selectColor:[UIColor whiteColor] unSelectColor:[UIColor lightGrayColor] selectFont:[UIFont systemFontOfSize:16] unSelectFont:[UIFont systemFontOfSize:14]];
    //设置滑动颜色
    self.topScrollViews.lineColor = RGB(220, 80, 70);
    //设置滚动的类型，线条，色块，椭圆色块
//    self.topScrollViews.lineType = LXKScrollViewTypeAboutRectangle;
    //设置顶部的背景色
    self.topScrollViews.backgroundColor = [UIColor blackColor];
    
    self.topScrollViews.delegate = self;
    [self.view addSubview:self.topScrollViews];
    //往scrollview添加的控件，由于addsub看中frame方法，所以此处初始化可以不写frame
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor yellowColor];
    
    tabview3 = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tabview3.delegate = self;
    tabview3.dataSource = self;
    tabview3.rowHeight = 60;
    
    tabview1 = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tabview1.delegate = self;
    tabview1.dataSource = self;
    tabview1.rowHeight = 60;
    
    [self.topScrollViews addSubViewToScrollerViewWithSubArr:@[tabview1,view1,tabview3]];
    // Do any additional setup after loading the view.
}
#pragma scrollviewDelegate
//点击了顶部的第几个按钮
- (void)clickScrollViewTopBtnWithIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld个",(long)index);
}
//滑动到scrollview的第几个content
- (void)scrollerToIndex:(NSInteger)index
{
    NSLog(@"这是个第个%ld",(long)index);
}
#pragma tableviewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (tableView == tabview3) {
        //右边的 >
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [NSString stringWithFormat:@"tableviewcell%ld",indexPath.row];
        return cell;
    }else{
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [NSString stringWithFormat:@"测试cell%ld",indexPath.row];
    cell.detailTextLabel.text = @"欢迎Stars";
    cell.detailTextLabel.textColor = [UIColor grayColor];
    return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == tabview3) {
        LeftTableViewController *vc = [[LeftTableViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        TwoLinkageView *vc =[[TwoLinkageView alloc]init];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (NSString *)title{
    return @"测试滑动";
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
