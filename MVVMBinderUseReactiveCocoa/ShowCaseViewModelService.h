//
//  ShowCaseViewModelService.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowCaseViewModelService : NSObject

- (RACSignal *)fetchDataWithParam:(NSString *)param;

@end
