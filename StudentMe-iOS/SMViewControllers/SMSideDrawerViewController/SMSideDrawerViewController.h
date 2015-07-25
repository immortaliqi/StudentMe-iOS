//
//  SMSideDrawerViewController.h
//  StudentMe-iOS
//
//  Created by SeanChense on 15/7/25.
//  Copyright (c) 2015年 UESTC-BBS. All rights reserved.
//

#import "SMBaseViewController.h"
#import "UIViewController+MMDrawerController.h"

typedef NS_ENUM(NSInteger, DrawerSection){
    DrawerSectionUserInfo,
    DrawerSectionDrawerMenu,
    DrawerSectionFeedback
};
@interface SMSideDrawerViewController : SMBaseViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *drawerWidths;

@end
