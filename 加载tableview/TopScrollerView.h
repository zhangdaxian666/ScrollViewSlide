//
//  TopScrollerView.h
//  加载tableview
//
//  Created by slcf888 on 2018/1/11.
//  Copyright © 2018年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollerViewType.h"

@protocol TopScrollerViewDelegate <NSObject>   //代理方法
- (void)clickScrollViewTopBtnWithIndex:(NSInteger)index; //点击了顶部的第几个按钮
- (void)scrollerToIndex:(NSInteger)index;  //滑动到scrollerview的第几个
@end

@interface TopScrollerView : UIView 

@property (nonatomic, weak) id<TopScrollerViewDelegate> delegate;

@property (nonatomic, strong) UIColor *lineColor;      //滚动条的颜色
@property (nonatomic, assign) LXKScrollViewType lineType; //滑块的类型

/*创建scrollerviews滑动
 frame 控件的frame                    selectColor控件顶部选中的字体颜色
 titleArr 控件顶部的title数组        unselectColor控件顶部未选中的字体颜色
 selectFont控件顶部选中的字体大小    unSelectFont控件顶部未选中的字体大小
*/
+ (TopScrollerView *)instanceViewWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr selectColor:(UIColor *)selectColor unSelectColor:(UIColor *)unselectColor selectFont:(UIFont *)selectFont unSelectFont:(UIFont *)unSelectFont;
/*
 向scrollerview添加子控件
 */
- (void)addSubViewToScrollerViewWithSubArr:(NSArray *)subViewArr;

@end
