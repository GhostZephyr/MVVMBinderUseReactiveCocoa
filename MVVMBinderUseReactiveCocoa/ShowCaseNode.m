//
//  ShowCaseNode.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/3.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseNode.h"

@implementation ShowCaseNode
@synthesize tableView = _tableView;

- (void)attach:(UIView *)rootView {
    self.parentView = rootView;
    [self.parentView addSubview:self.tableView];
    self.tableView.frame = self.parentView.frame;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)dettach {
    [self.tableView removeFromSuperview];
    [self.rac_deallocDisposable dispose];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (ASTableView *)tableView {
    if (!_tableView) {
        _tableView = [[ASTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain asyncDataFetching:YES];
    }
    return _tableView;
}

@end
