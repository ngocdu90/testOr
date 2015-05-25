//
//  AccessNew.h
//  VNN
//
//  Created by Yosetime_GiangThao on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface AccessNew : NSObject

- (NSMutableArray*) getItemFromRssURL: (NSURL *) url;


@end
