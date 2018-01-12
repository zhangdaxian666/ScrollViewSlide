//
//  UITextViewController.m
//  加载tableview
//
//  Created by slcf888 on 2018/1/3.
//  Copyright © 2018年 slcf888. All rights reserved.
//

#import "UITextViewController.h"

@interface UITextViewController ()

@end

@implementation UITextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    textview.textColor = [UIColor blackColor];
    textview.showsVerticalScrollIndicator = NO;
    textview.text = @"七宝也是为他人做嫁衣真的不知道攀爬而去哟包对他们的诱惑真是太大了zhenshikanbukaizheshishenmeqibaoyehshiweiterenzhengzaizhegeshihsangelaoguaiwuquanbufeuquzhendeshizuikbuzhidaoshahekknsdkvbadvb里 v 啊看看吧啊看不到绿坝克雷斯波 v 啊克雷斯波 v 大两败俱伤 v 阿里卡 v 白老师 v 吧开始变得 v 卡洛斯的 v 把金沙江路的 v 看吧里看的剧吧的恐惧吧开始的 v 将巴洛克式具白色款 v 的酒吧是来看 v 的吧卡十点半 v 啊看就是 v 艾萨克 v 白色的镂空 v 把你说的 v 卡的考虑洁白的 v 北京啊深刻的 v把两节课 v 把路上看到 v 比较爱看 v 百度是老虎 v 爱 v 和 iu 孵化器哦 i 很气愤和 i 请勿俄方空气金额和父亲恶化赶快去黑高跟 i 好快放假哈快回复 i 个哈联手 i 温哥华啦我可不合理啊啊是会计法规齁 i 啊是够API和嘎嘎 i 狗啊个哈咯";
    textview.font=[UIFont fontWithName:@"Arial" size:48.0];
    [self.view addSubview:textview];
    textview.editable = NO;        //是否允许编辑内容，默认为“YES”
    textview.returnKeyType = UIReturnKeyGo;//return键的类型
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
http://blog.csdn.net/zwp438123895/article/details/38396225
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
