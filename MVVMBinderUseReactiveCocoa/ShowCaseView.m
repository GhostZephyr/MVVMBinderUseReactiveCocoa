//
//  ShowCaseView.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseView.h"

@interface ShowCaseView() {
    
}


@end

@implementation ShowCaseView
@synthesize tableView = _tableView;

- (void)attach:(UIView *)rootView {
    self.parentView = rootView;
    [self.parentView addSubview:self.tableView];
    
    self.tableView.frame = rootView.frame;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.tableFooterView = [UIView new];
}

- (void)dettach {
    [self.rac_deallocDisposable dispose];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark
#pragma mark Property
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}
@end
