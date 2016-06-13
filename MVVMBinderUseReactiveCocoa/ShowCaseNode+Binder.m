//
//  ShowCaseNode+Binder.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/3.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseNode+Binder.h"
#import <objc/runtime.h>
#import "ShowCaseCellNode.h"

static void *viewModelKey = &viewModelKey;

@implementation ShowCaseNode (Binder)

- (void)setViewModel:(ShowCaseViewModel *)viewModel {
    objc_setAssociatedObject(self, &viewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ShowCaseViewModel *)viewModel {
    return objc_getAssociatedObject(self, &viewModelKey);
}

- (void)bindToViewModel:(id<ShowCaseViewModelProtocol>)viewModel {
    self.tableView.asyncDataSource = self;
    self.tableView.asyncDelegate = self;
    self.viewModel = viewModel;
    [self.viewModel setIsActive:YES];
    
    @weakify(self);
    [self.rac_deallocDisposable addDisposable:[RACObserve(self.viewModel, datas) subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }]];
    
    [self.rac_deallocDisposable addDisposable:[RACObserve(self.viewModel, isBusy) subscribeNext:^(NSNumber *x) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:x.boolValue];
    }]];
    
    [[self.viewModel.loadDataCommand execute:nil] doError:^(NSError *error) {
        @strongify(self);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:error.domain preferredStyle:UIAlertControllerStyleAlert];
        [self.parentController presentViewController:alert animated:YES completion:nil];
    }];

}

- (ASCellNode *)tableView:(ASTableView *)tableView nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowCaseCellNode *node = [ShowCaseCellNode new];
    
    [node setData:self.viewModel.datas[indexPath.row]];
    return node;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
