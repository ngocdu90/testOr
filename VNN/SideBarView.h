//
//  SideBarView.h
//  VNN
//
//  Created by Yosetime_GiangThao on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideBarView : UIViewController
@property (nonatomic) BOOL isShowMenu;
@property (nonatomic) NSInteger indexClick;
@property (nonatomic) BOOL isEdit;
@property (nonatomic) UIViewController *currentVC;
@property (nonatomic) UICollectionView *mainView;
-(void)showHelloNavigationInView:(UICollectionView*)view;
-(void)hideHelloNavigation;
@property (strong, nonatomic) IBOutlet UITableView *tbMain;

@end
