//
//  SideBarView.m
//  VNN
//
//  Created by Yosetime_GiangThao on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import "SideBarView.h"

@interface SideBarView () <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *arr;
}

@end

@implementation SideBarView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self swipeToHideMenu];
    [[UITableView appearance] setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    // Do any additional setup after loading the view from its nib.
    arr = [[NSMutableArray alloc] initWithObjects:@"Trang Chủ", @"Xã Hội", @"Giáo Dục", @"Kinh Tế", @"Chính Trị", @"Quốc tế", @"Văn Hoá", @"Khoa Học",  nil];

    self.tbMain.delegate = self;
    self.tbMain.dataSource = self;
    [self.tbMain registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.isEdit = false;
    self.indexClick = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tbMain dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.indexClick = indexPath.row;
    
    self.isEdit = true;
    
    [self.mainView reloadData];
    
    [self hideHelloNavigation];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Show and hide navigation menu
-(void)swipeToHideMenu{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideHelloNavigation)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
}

-(void)showHelloNavigationInView:(UICollectionView*)view{
    __block CGRect frame = self.view.frame;
    frame.origin.x = -self.view.frame.size.width;
    frame.size.width = [UIScreen mainScreen].bounds.size.width/1.5;
    frame.size.height = [UIScreen mainScreen].bounds.size.height/1.5;
    self.view.frame = frame;
    self.view.alpha = 0.8f;
    [view addSubview:self.view];
    [UIView animateWithDuration:0.5f animations:^{
        frame.origin.x = 0;
        self.view.frame = frame;
    } completion:^(BOOL finished) {

    }];
    self.isShowMenu = YES;
    self.mainView = view;
}

-(void)hideHelloNavigation{
    [UIView animateWithDuration:0.3f animations:^{
        CGRect frame = self.view.frame;
        frame.origin.x = -self.view.frame.size.width;;
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    self.isShowMenu = NO;
    
    self.mainView.scrollEnabled = true;
    
    self.mainView.alpha = 1.0f;
    
}

@end
