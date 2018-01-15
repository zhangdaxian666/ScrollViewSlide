//
//  RightViewController.h
//  TableVIew联动
//
//  Created by lisonglin on 17/08/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RightViewControllerDelegate <NSObject>

- (void)willDisplayHeaderView:(NSInteger)section;

- (void)didEndDisplayHeaderView:(NSInteger)section;

@end

@interface RightViewController : UIViewController

@property(nonatomic, weak) id<RightViewControllerDelegate> delegate ;


/**
 当左边tableView滚动式，右边的tableView跟随滚动到指定section

 @param indexPath index
 */
- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath;

@end
