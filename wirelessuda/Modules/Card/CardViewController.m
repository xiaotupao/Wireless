//
//  CardViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardViewController.h"
#import "CustomButton.h"
#import "GuaShiViewController.h"
#import "ChangeCardPasswordViewController.h"
#import "ConsumptionSearchViewController.h"
#import "PickCardViewController.h"

@interface CardViewController ()

@end

@implementation CardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"苏大通应用";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSMutableArray *icons=[NSMutableArray arrayWithObjects:@"news.png", @"gateway", @"bus.png", @"calendar.png", nil];
    NSMutableArray *names=[NSMutableArray arrayWithObjects:@"苏大通挂失", @"修改密码", @"当日消费", @"捡卡功能", nil];
    for (int i=0,j=-1; i<[icons count]; i++) {
        if ((i)%4 == 0) {
            j++;
        }
        CustomButton *button=[[CustomButton alloc]initWithFrame:CGRectMake(15+(i-j*4)*75, 100*j+100, 65, 85)];
        [button.icon setBackgroundImage:[UIImage imageNamed:[icons objectAtIndex:i]] forState:UIControlStateNormal];
        button.name.text=[names objectAtIndex:i];
        button.icon.tag=i;
        [button.icon addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}
-(void)buttonClicked:(id)sender
{
    UIButton *button=(UIButton *)sender;
    int btTag=button.tag;
    switch (btTag) {
        case 0:
        {
            GuaShiViewController *guaShiViewController=[[GuaShiViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:guaShiViewController  animated:YES];
            self.navigationController.navigationBar.hidden=NO;
        }
            break;
        case 1:
        {
            ChangeCardPasswordViewController *changeCardPasswordViewController=[[ChangeCardPasswordViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:changeCardPasswordViewController animated:YES];
            changeCardPasswordViewController.navigationController.navigationBar.hidden=NO;
        }
            break;
        case 2:
        {
            ConsumptionSearchViewController *consumptionSearchViewController=[[ConsumptionSearchViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:consumptionSearchViewController animated:YES];
            consumptionSearchViewController.navigationController.navigationBar.hidden=NO;
        }
            break;
        case 3:
        {
            PickCardViewController *pickCardViewController=[[PickCardViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:pickCardViewController animated:YES];
            pickCardViewController.navigationController.navigationBar.hidden=NO;
        }
            break;
        default:
        {
            
        }
            break;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
