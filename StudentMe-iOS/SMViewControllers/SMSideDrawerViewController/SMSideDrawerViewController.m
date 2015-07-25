//
//  SMSideDrawerViewController.m
//  StudentMe-iOS
//
//  Created by SeanChense on 15/7/25.
//  Copyright (c) 2015年 UESTC-BBS. All rights reserved.
//

#import "SMSideDrawerViewController.h"
#import "SMLeftSideViewTableViewCell.h"

@interface SMSideDrawerViewController ()

@end

@implementation SMSideDrawerViewController

- (void)viewDidLoad {
    if(OSVersionIsAtLeastiOS7()){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    else {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    for (NSString * identifier in @[@"SMLeftSideViewTableViewCell"]) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
    }
    
    
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    
    UIColor * tableViewBackgroundColor;
    if(OSVersionIsAtLeastiOS7()){
        tableViewBackgroundColor = [UIColor colorWithRed:110.0/255.0
                                                   green:113.0/255.0
                                                    blue:115.0/255.0
                                                   alpha:1.0];
    }
    else {
        tableViewBackgroundColor = [UIColor colorWithRed:77.0/255.0
                                                   green:79.0/255.0
                                                    blue:80.0/255.0
                                                   alpha:1.0];
    }
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:66.0/255.0
                                                  green:69.0/255.0
                                                   blue:71.0/255.0
                                                  alpha:1.0]];
    // 设置 Navitagtionbar 的样式
    //    UIColor * barColor = [UIColor colorWithRed:161.0/255.0
    //                                         green:164.0/255.0
    //                                          blue:166.0/255.0
    //                                         alpha:1.0];
    //    if([self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)]){
    //        [self.navigationController.navigationBar setBarTintColor:barColor];
    //    }
    //    else {
    //        [self.navigationController.navigationBar setTintColor:barColor];
    //    }
    //
    //
    //    NSDictionary *navBarTitleDict;
    //    UIColor * titleColor = [UIColor colorWithRed:55.0/255.0
    //                                           green:70.0/255.0
    //                                            blue:77.0/255.0
    //                                           alpha:1.0];
    //    navBarTitleDict = @{NSForegroundColorAttributeName:titleColor};
    //    [self.navigationController.navigationBar setTitleTextAttributes:navBarTitleDict];
    self.navigationController.navigationBarHidden = YES;
    
    self.drawerWidths = @[@(160),@(200),@(240),@(280),@(320)];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    //    CGRect frame = CGRectMake(self.tableView.frame.origin.x
    //                              , self.tableView.frame.origin.y,
    //                              self.tableView.frame.size.width,
    //                               self.tableView.frame.size.height);
    //    [self.tableView setFrame:frame];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)contentSizeDidChange:(NSString *)size{
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case DrawerSectionUserInfo:
            return 1;
        case DrawerSectionDrawerMenu:
            return 6;
        case DrawerSectionFeedback:
            return 1;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LeftSideMenuTableViewCell";
    
    SMLeftSideViewTableViewCell *cell = (SMLeftSideViewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[SMLeftSideViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    }
    
    
    
    switch (indexPath.section) {
        case DrawerSectionUserInfo:
            if(indexPath.row == 0){
                [cell.textLabel setText:@"UserName"];
                
            }
            else {
                [cell.textLabel setText:@"Full View Change"];
            }
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
        case DrawerSectionDrawerMenu:{
            //Implement in Subclass
            break;
        }
        case DrawerSectionFeedback:{
            [cell.textLabel setText:@"Show Shadow"];
            if(self.mm_drawerController.showsShadow)
                [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            else
                [cell setAccessoryType:UITableViewCellAccessoryNone];
            break;
        }
            
        default:
            break;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
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
