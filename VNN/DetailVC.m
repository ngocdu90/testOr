//
//  DetailVC.m
//  VNN
//
//  Created by Yosetime_GiangThao on 4/19/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.webView.delegate = self;
    
    NSLog(@"%@",self.strLink);

    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.strLink]];
    
    if (jsonData==nil) {
        self.strLink = [self.strLink stringByReplacingOccurrencesOfString:@" " withString:@""];
        self.strLink = [self.strLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        NSData *jsonData2 = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.strLink]];
        if (jsonData2 == nil) {
            self.navItem.title = @"Error 404!";
        }
    }
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.strLink]];
    
    [self.webView loadRequest:request];
    
}

- (IBAction)Back
{
    [self.navigationController popToRootViewControllerAnimated:TRUE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
