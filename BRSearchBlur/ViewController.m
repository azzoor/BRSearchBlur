//
//  ViewController.m
//  BRSearchBlur
//
//  Created by Aaron Stephenson on 23/09/2014.
//  Copyright (c) 2014 Bronron Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UISearchBar *searchbar;
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    [self.scrollView addSubview:self.searchbar];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Screen Shot 2014-09-23 at 11.01.42 am.png"]];
    [imageView setFrame:CGRectMake(0, self.searchbar.frame.origin.y+self.searchbar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    [self.scrollView addSubview:imageView];
    [self.scrollView sendSubviewToBack:imageView];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [self.visualEffectView setFrame:imageView.frame];
    [self.visualEffectView setAlpha:0];
    [self.scrollView addSubview:self.visualEffectView];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, imageView.frame.size.height+self.searchbar.frame.size.height+self.searchbar.frame.origin.y)];
    [self.scrollView setContentOffset:CGPointMake(0, self.searchbar.frame.origin.y+self.searchbar.frame.size.height)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchbar resignFirstResponder];
    float distanceToTop = 1-(scrollView.contentOffset.y/44);
    self.visualEffectView.alpha = distanceToTop;
}

@end
