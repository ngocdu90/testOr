//
//  ViewController.m
//  VNN
//
//  Created by dutran on 4/17/15.
//  Copyright (c) 2015 i-Keyword. All rights reserved.
//

#import "ViewController.h"
#import "AccessNew.h"
#import "Item.h"
#import "CellItem.h"
#import "SideBarView.h"
#import "DetailVC.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>{
    SideBarView *sideBarNavi;
}
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtn;

@property (strong, nonatomic) IBOutlet UINavigationItem *naviItem;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actiLoad;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *menuView;

@property (strong ,nonatomic) NSMutableDictionary *cachedImages;

@property (nonatomic) NSString *strLinkClick;

- (void) getRSS;

@property (nonatomic) NSMutableArray *arrItem;

@end

static NSString *indentifier = @"CellIndentitier";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"CellItem" bundle:nil] forCellWithReuseIdentifier:indentifier];
    self.collectionView.decelerationRate = 0.5f;
    
    //     Configure layout
//    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [self.flowLayout setItemSize:CGSizeMake(182, 200)];
//    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    self.flowLayout.minimumInteritemSpacing = 0.0f;
//    self.flowLayout.minimumLineSpacing = 30.0f;
//    [self.collectionView setCollectionViewLayout:self.flowLayout];
//    self.collectionView.bounces = YES;
//    [self.collectionView setShowsHorizontalScrollIndicator:NO];
//    [self.collectionView setShowsVerticalScrollIndicator:NO];
    
    //
    [self.barBtn setAction:@selector(touchSidebar:)];
    self.barBtn.target = self;
    self.strLinkClick = [[NSString alloc] init];
    
    
    //
    sideBarNavi = [[SideBarView alloc] initWithNibName:@"SideBarView" bundle:nil];
    sideBarNavi.currentVC = self;
    sideBarNavi.indexClick = 0;
    self.cachedImages = [[NSMutableDictionary alloc] init];
    self.arrItem = [[NSMutableArray alloc] init];
    
    
}

- (void) touchSidebar:(id) sender{
    
    NSLog(@"open sidebar");
    if (!sideBarNavi.isShowMenu) {
        [sideBarNavi showHelloNavigationInView:self.collectionView];
        
        self.collectionView.scrollEnabled = false;
        [self.collectionView setContentOffset:CGPointZero animated:NO];
        
    }else{
        [sideBarNavi hideHelloNavigation];
        self.collectionView.scrollEnabled = true;
    }
    
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"");
}

-(void)viewWillAppear:(BOOL)animated{

    [self getRSS];

}

- (void) getRSS{
    // Get rss new
    
    if (sideBarNavi.indexClick == 0) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/home.rss"]];
        self.naviItem.title = @"Trang Chủ";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
    if (sideBarNavi.indexClick == 1) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/xa-hoi.rss"]];
        self.naviItem.title = @"Xã Hội";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
    if (sideBarNavi.indexClick == 2) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/giao-duc.rss"]];
        self.naviItem.title = @"Giáo Dục";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
    if (sideBarNavi.indexClick == 3) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/kinh-te.rss"]];
        self.naviItem.title = @"Kinh Tế";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
    if (sideBarNavi.indexClick == 4) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/chinh-tri.rss"]];
        self.naviItem.title = @"Chính Trị";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
    if (sideBarNavi.indexClick == 5) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/quoc-te.rss"]];
        self.naviItem.title = @"Quốc Tế";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
    if (sideBarNavi.indexClick == 6) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/van-hoa.rss"]];
        self.naviItem.title = @"Văn Hoá";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
    if (sideBarNavi.indexClick == 7) {
        [self.actiLoad startAnimating];
        AccessNew *access = [AccessNew new];
        self.arrItem = [access getItemFromRssURL:[NSURL URLWithString:@"http://vietnamnet.vn/rss/khoa-hoc.rss"]];
        self.naviItem.title = @"Khoa Học";
        [self.actiLoad stopAnimating];
        self.actiLoad.hidden = true;
    }
}

#pragma mark UICollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (sideBarNavi.isEdit) {
        [self getRSS];
        self.cachedImages = [[NSMutableDictionary alloc] init];
        sideBarNavi.isEdit = false;
    }
    return self.arrItem.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    

    
    CellItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    
//    cell.imgItem.image = [UIImage imageNamed:@"ImagePlaceholder.png"];
    
    NSString *identifier = [NSString stringWithFormat:@"Cell%ld",(long)indexPath.row];
    
    __block  Item *item = [self.arrItem objectAtIndex:indexPath.row];
    
    if([self.cachedImages objectForKey:identifier] != nil){
        cell.imgItem.image = [self.cachedImages valueForKey:identifier];
    }else{
     
        
        // Dispatch to get image data
        
        //get a dispatch queue
        dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //this will start the image loading in bg
        dispatch_async(concurrentQueue, ^{
            
            NSURL *url = [[NSURL alloc] initWithString:item.strImageURL];
            
            NSData *image = [[NSData alloc] initWithContentsOfURL:url];
            
            //this will set the image when loading is finished
            dispatch_async(dispatch_get_main_queue(), ^{
                
//                cell.imgItem.image = [UIImage imageWithData:image];
                
//                if ([self.collectionView indexPathForCell:cell].row == indexPath.row) {
                
                    [self.cachedImages setValue:[UIImage imageWithData:image] forKey:identifier];
                    
                    cell.imgItem.image = [self.cachedImages valueForKey:identifier];
//                }
                
            });
        });
        
        
    }
    
    cell.lbPubDate.text = item.pubDate;
    
    cell.lbTitle.text = item.title;
    
    //
    //    SEL a = @selector(userTappedOnLink:);
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isTap:)];
    
    // if labelView is not set userInteractionEnabled, you must do so
    [cell.lbTitle setUserInteractionEnabled:YES];
        cell.lbTitle.tag = indexPath.row;
    [cell.lbTitle addGestureRecognizer:gesture];
    
    return cell;
    
}

- (void) isTap: (UITapGestureRecognizer *)gr{
    
    UILabel *label = gr.view;
    NSInteger tag = label.tag;
    NSLog(@"%ld", (long)tag);
    DetailVC *detail = [[DetailVC alloc] initWithNibName:@"DetailVC" bundle:nil];

    Item *item = [self.arrItem objectAtIndex:tag];
    detail.strLink = item.strLinkURL;
    
    [self.navigationController pushViewController:detail animated:TRUE];
    
}

- (void) userTappedOnLink: (NSString*) str{
    

    
}


@end
