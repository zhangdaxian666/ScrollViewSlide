//
//  ViewController.m
//  加载tableview
// https://github.com/ninjaprox/NVActivityIndicatorView
//  Created by slcf888 on 2017/12/28.
//  Copyright © 2017年 slcf888. All rights reserved.
//。http://blog.csdn.net/studying_ios/article/details/54094305

#import "ViewController.h"
#import "TableViewCell.h"

#import "FFViewController.h"
#import "UITextViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *centerTableview;
@property (nonatomic, strong) NSMutableArray *centerDataArray;
@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"哇咔咔";
    
    self.array = @[@"哇咔咔",@"不是说的不知道写的什么到底是什么不知道管他呢随便啦",@"终于快写完了",@"没了",@"天哪又加了两个疯了吗",@"真是不知道写什么话了词多用干了还是写一首诗吧锄禾日当午飞流直下三千尺只缘身在此山中记事本怎么用着这都是什么啊这么无聊嘛算了"];
    [self.view addSubview:self.centerTableview];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSMutableArray *)centerDataArray
{
    if (!_centerDataArray) {
        _centerDataArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    }
    return _centerDataArray;
}
static NSString *const centerCellId = @"centerCellId";
- (UITableView *)centerTableview
{
    if (!_centerTableview) {
        _centerTableview =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _centerTableview.delegate = self;
        _centerTableview.dataSource = self;
//        _centerTableview.rowHeight = 148;
//        _centerTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        
      
        [_centerTableview registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:centerCellId];
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 8)];
        _centerTableview.tableFooterView = footerView;
    }
    return _centerTableview;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.centerDataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId;
    cellId = centerCellId;
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.label.text = self.array[indexPath.section];
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    cell.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        UITextViewController *vcd = [[UITextViewController alloc]init];
        [self.navigationController pushViewController:vcd animated:YES];
    }else{
        FFViewController *vc =[[FFViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
