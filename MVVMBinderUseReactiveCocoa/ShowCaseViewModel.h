//
//  ShowCaseViewModel.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowCaseViewModelProtocol.h"

@interface ShowCaseViewModel : NSObject<ShowCaseViewModelProtocol>

- (instancetype)initWithTitle:(NSString *)pageTitle;

@end
