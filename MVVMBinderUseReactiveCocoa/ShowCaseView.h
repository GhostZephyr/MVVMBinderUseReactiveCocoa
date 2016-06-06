//
//  ShowCaseView.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowCaseViewProtocol.h"

@interface ShowCaseView : NSObject <ShowCaseViewProtocol>

@property (nonatomic, weak) UIView *parentView;

@property (nonatomic, weak) UIViewController *parentController;

@property (nonatomic, strong, readonly) UITableView *tableView;

@end
