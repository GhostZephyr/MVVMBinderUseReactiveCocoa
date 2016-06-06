//
//  ShowCaseView+Binder.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseView+Binder.h"
#import "ShowCaseTableViewCell.h"
#import <objc/objc-runtime.h>

static void *viewModelKey = &viewModelKey;

@implementation ShowCaseView (Binder)

- (void)setViewModel:(ShowCaseViewModel *)viewModel {
    objc_setAssociatedObject(self, &viewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ShowCaseViewModel *)viewModel {
    return objc_getAssociatedObject(self, &viewModelKey);
}

- (void)bindToViewModel:(id<ShowCaseViewModelProtocol>)viewModel {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.viewModel = viewModel;
    [self.viewModel setIsActive:YES];
    
    @weakify(self);
    
//    __weak typeof(*&self) weakSelf = self;
    [RACObserve(self.viewModel, datas) subscribeNext:^(id x) {
//      __strong typeof(*&self) strongSelf = weakSelf;
        @strongify(self);
        [self.tableView reloadData];
    }];
    
    [self.rac_deallocDisposable addDisposable:[RACObserve(self.viewModel, isBusy) subscribeNext:^(NSNumber *x) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:x.boolValue];
    }]];
    
    [[self.viewModel.loadDataCommand execute:nil] doError:^(NSError *error) {
        @strongify(self);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:error.domain preferredStyle:UIAlertControllerStyleAlert];
        [self.parentController presentViewController:alert animated:YES completion:nil];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowCaseTableViewCell *cell = [[ShowCaseTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"showCase"];
    [cell setData:self.viewModel.datas[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}
@end
