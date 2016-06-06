//
//  ShowCaseViewModel.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseViewModel.h"
#import "ShowCaseViewModelService.h"

@interface ShowCaseViewModel() {
    RACCommand *_initDataCommand;
}

@property (nonatomic, strong) ShowCaseViewModelService *viewModelService;

@end

@implementation ShowCaseViewModel
@synthesize datas;
@synthesize pageTitle;
@synthesize isBusy;
@synthesize isActive;

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.viewModelService = [[ShowCaseViewModelService alloc] init];
        self.pageTitle = title;
    }
    return self;
}

- (RACCommand *)loadDataCommand {
    if (!_initDataCommand) {
        @weakify(self);
        _initDataCommand = [[RACCommand alloc] initWithEnabled:RACObserve(self, isActive) signalBlock:^RACSignal *(id input) {
            @strongify(self);
            self.isBusy = YES;
            return [[[self.viewModelService fetchDataWithParam:input] doNext:^(NSArray *result) {
                @strongify(self);
                self.isBusy = NO;
                self.datas = [NSArray arrayWithArray:result];
            }] setNameWithFormat:@"fetchDataWithParam"];
        }];
    }
    return _initDataCommand;

}
@end
