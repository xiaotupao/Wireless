//
//  ConsumptionSearchViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-18.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ConsumptionSearchViewController.h"

@interface ConsumptionSearchViewController ()

@end
@implementation ConsumptionSearchViewController
@synthesize tableView=_tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"消费查询";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(20, 80, 80, 40)];
    name.text=@"姓名:孙旭";
    UILabel *stuId=[[UILabel alloc]initWithFrame:CGRectMake(20, 110, 150, 40)];
    stuId.text=@"账号:1127403119";
    
    [self.view addSubview:stuId];
    [self.view addSubview:name];
}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell=[UITableViewCell alloc]initWithFrame:<#(CGRect)#>;
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
