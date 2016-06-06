//
//  ShowCaseViewController.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/2.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseViewController.h"
#import "ShowCaseView+Binder.h"
#import "ShowCaseViewModel.h"
#import "ShowCaseNode+Binder.h"

@interface ShowCaseViewController()

@property (nonatomic, strong) NSObject<ShowCaseViewProtocol> *showCaseView;

@property (nonatomic, strong) ShowCaseViewModel *viewModel;

@end

@implementation ShowCaseViewController

- (instancetype)initWithType:(ShowCaseViewType)type
{
    self = [super init];
    if (self) {
        NSString *pageTitle;
        switch (type) {
            case ShowCaseViewType_Normal:
                self.showCaseView = [ShowCaseView new];
                ((ShowCaseView *)self.showCaseView).parentController = self;
                break;
                
            default:
                self.showCaseView = [ShowCaseNode new];
                ((ShowCaseNode *)self.showCaseView).parentController = self;
                break;
        }
        
        self.viewModel = [[ShowCaseViewModel alloc] initWithTitle:pageTitle];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.showCaseView attach:self.view];
    [self.showCaseView bindToViewModel:self.viewModel];
    
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.showCaseView dettach];
}

@end
