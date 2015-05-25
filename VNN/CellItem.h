//
//  CellItem.h
//  VNN
//
//  Created by Yosetime_GiangThao on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellItem : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *lbPubDate;
@property (strong, nonatomic) IBOutlet UIImageView *imgItem;
@property (strong, nonatomic) IBOutlet UILabel *lbTitle;
@property (strong, nonatomic) IBOutlet UIView *viewTitle;
@property (strong, nonatomic) IBOutlet UILabel *viewPubDate;

@end
