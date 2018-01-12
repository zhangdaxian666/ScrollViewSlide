//
//  FFViewController.m
//  加载tableview
//
//  Created by slcf888 on 2017/12/28.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "FFViewController.h"

@interface FFViewController ()

@end

@implementation FFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    NSString *str = @"人生若只如初见，何事悲风秋画扇";
    //创建NSMutableAttributedString
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:str];
    
    //设置字体和设置字体的范围
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30.0f] range:NSMakeRange(0, 1)];
    //添加文字颜色
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
   
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 100, 200, 0)];
    label.backgroundColor = [UIColor greenColor];
    //自动换行
    label.textColor =[UIColor yellowColor];
    label.numberOfLines = 0;
    //设置label的富文本
    label.attributedText = attrStr;
    //label高度自适应
    [label sizeToFit];
    [self.view addSubview:label];
    
    // Do any additional setup after loading the view.
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
