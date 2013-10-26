//
//  WLSudaMainViewController.m
//  wirelessuda
//
//  Created by Mac on 13-10-23.
//  Copyright (c) 2013年 苏州大学网络中心. All rights reserved.
//

#import "WLSudaMainViewController.h"

@interface WLSudaMainViewController ()

@end

@implementation WLSudaMainViewController
@synthesize topScrollView;
@synthesize pageControl;

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
    
    
    //??????????图标命名
    if (SCREEN_HEIGHT>480) {
        //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background@2x.png"]]];
    }
    else
    {
        //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    }
    
    topScrollView=[[mainViewScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
    topScrollView.delegate=self;
    [topScrollView setImage];
#pragma mark - 定时器
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
#pragma mark - 初始化mypagecontrol
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(110, 140, 100, 15)];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
    [pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    
#pragma mark - 模块
    CGFloat height=topScrollView.frame.size.height+15;
    NSMutableArray *icons=[NSMutableArray arrayWithObjects:@"news.png", @"gateway.png", @"bus.png", @"calendar.png", @"card.png",@"weather.png",@"settings.png", nil];
    NSMutableArray *names=[NSMutableArray arrayWithObjects:@"苏大新闻", @"网关应用", @"班车路线", @"苏大校历", @"苏大通",@"即时天气",@"账号设置", nil];
    for (int i=0,j=-1; i<[icons count]; i++) {
        if ((i)%4 == 0) {
            j++;
        }
        CustomButton *button=[[CustomButton alloc]initWithFrame:CGRectMake(15+(i-j*4)*75, height+110*j, 65, 85)];
        [button.icon setBackgroundImage:[UIImage imageNamed:[icons objectAtIndex:i]] forState:UIControlStateNormal];
        button.name.text=[names objectAtIndex:i];
        button.icon.tag=i;
        [button.icon addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }

    
    [self.view addSubview:topScrollView];
    [self.view addSubview:pageControl];
    
}

-(void)buttonClicked:(id)sender
{
    UIButton *button=(UIButton *)sender;
    int btTag=button.tag;
    switch (btTag) {
        case 0:
        {
            //苏大新闻
        }
            break;
        case 1:
        {
            //网关应用
        }
            break;
        case 2:
        {
            //班车路线
        }
            break;
        case 3:
        {
            //苏大校历
        }
            break;
        case 4:
        {
            //苏大通
        }
            break;
        case 5:
        {
            //即时天气
        }
            break;
        case 6:
        {
            //账号设置
        }
            break;
        default:
            break;
    }
}

#pragma mark - scrollView 委托函数
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pagewidth = topScrollView.frame.size.width;
    int page = floor(topScrollView.contentOffset.x / pagewidth);
    page --;
    pageControl.currentPage = page;
}

#pragma mark - scrollView 委托函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = topScrollView.frame.size.width;
    int currentPage = floor(topScrollView.contentOffset.x/pagewidth);
    if (currentPage == 0) {
        [topScrollView scrollRectToVisible:CGRectMake(320 * 4, 0, 320, 150) animated:NO];
    }
    else if (currentPage == 5) {
        [topScrollView scrollRectToVisible:CGRectMake(320, 0, 320, 150) animated:NO];
    }
}

- (void)runTimePage
{
    int page = pageControl.currentPage;
    page ++;
    page = page > 3 ? 0 : page ;
    pageControl.currentPage = page;
    [self turnPage];
}

//   ??????????????????????????????????????????????
#pragma mark - 选择器的方法
- (void)turnPage
{
    int page = pageControl.currentPage;
    [topScrollView scrollRectToVisible:CGRectMake(320 * (page+1), 0, 320, 150) animated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
