//
//  ShowCaseViewModelProtocol.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ShowCaseVMStatus_Busy,
    ShowCaseVMStatus_Normal,
    ShowCaseVMStatus_Error,
} ShowCaseVMStatus;

@protocol ShowCaseViewModelProtocol <NSObject>

@property (nonatomic, copy) NSArray *datas;

@property (nonatomic, copy) NSString *pageTitle;

@property (nonatomic) BOOL isBusy;

@property (nonatomic) BOOL isActive;

@property (nonatomic, readonly) RACCommand *loadDataCommand;

@end
