//
//  GateWayLoginViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-8.
//  Copyright (c) 2013年 苏州大学网络中心. All rights reserved.
//

#import "GateWayLoginViewController.h"

@interface GateWayLoginViewController ()

@end

@implementation GateWayLoginViewController

@synthesize login;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    login=[[UIWebView alloc]initWithFrame:CGRectMake(0, 20, 320, SCREEN_HEIGHT)];
    NSURL *url=[NSURL URLWithString:@"http://wg.suda.edu.cn"];
    [login loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:login];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
