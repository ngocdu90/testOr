//
//  CellItem.m
//  VNN
//
//  Created by Yosetime_GiangThao on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import "CellItem.h"
#import "DetailVC.h"

@implementation CellItem

- (void)awakeFromNib {
    // Initialization code
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CellIndentitier" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
    }
    return self;
}

@end
