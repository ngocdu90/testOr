//
//  Item.h
//  VNN
//
//  Created by Yosetime_GiangThao on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *des;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *strImageURL;
@property (nonatomic, strong) NSString *strLinkURL;
@property (nonatomic, strong) NSString *pubDate;

@end
