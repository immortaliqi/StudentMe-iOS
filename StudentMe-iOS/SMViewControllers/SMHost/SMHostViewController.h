//
//  SMHostViewController.h
//  StudentMe-iOS
//
//  Created by SeanChense on 15/7/25.
//  Copyright (c) 2015年 UESTC-BBS. All rights reserved.
//

#import "SMBaseViewController.h"

@interface SMHostViewController : SMBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView * tableView;


@end
