//
//  ShowCaseNode+Binder.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/3.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseNode.h"
#import "ShowCaseViewModel.h"

@interface ShowCaseNode (Binder) <ASTableViewDataSource, ASTableViewDelegate>

@property (nonatomic, weak) ShowCaseViewModel *viewModel;

@end
