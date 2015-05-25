//
//  AccessNew.m
//  VNN
//
//  Created by Yosetime_GiangThao on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import "AccessNew.h"

@interface AccessNew () <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableArray *feeds;
    Item *item;
    NSMutableString *title;
    NSMutableString *link;
    NSMutableString *des;
    NSMutableString *content;
    NSMutableString *image;
    NSMutableString *pubDate;
    NSString *element;
}

@end

@implementation AccessNew

- (NSMutableArray*) getItemFromRssURL: (NSURL *) url{
    
    feeds = [[NSMutableArray alloc] init];
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    parser.delegate = self;
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    NSLog(@"%@", parser);
    
    NSLog(@"%lu", (unsigned long)feeds.count);
    
    return feeds;
    
}

#pragma mark --ParseXML--
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    NSLog(@"element Name %@", elementName);
    
    if ([element isEqualToString:@"item"]) {
        
        item    = [[Item alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        image   = [[NSMutableString alloc] init];
        des   = [[NSMutableString alloc] init];
        content    = [[NSMutableString alloc] init];
        pubDate   = [[NSMutableString alloc] init];

        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    NSLog(@"str found: %@", string);
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    } else if ([element isEqualToString:@"image"]) {
        [image appendString:string];
    }else if ([element isEqualToString:@"description"]) {
        [des appendString:string];
    }else if ([element isEqualToString:@"pubDate"]) {
        [pubDate appendString:string];
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        item.title = title;
        item.des = des;
        item.content = @"";
        item.strImageURL = image;
        item.strLinkURL = link;
        item.pubDate = pubDate;
        [feeds addObject:item];
        
    }
    
}


@end
