//
//  ShowCaseView+Binder.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseView.h"
#import "ShowCaseViewModel.h"

@interface ShowCaseView (Binder) <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) ShowCaseViewModel *viewModel;

@end
