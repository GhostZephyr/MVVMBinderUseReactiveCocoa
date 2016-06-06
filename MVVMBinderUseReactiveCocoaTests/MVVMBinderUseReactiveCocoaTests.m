//
//  MVVMBinderUseReactiveCocoaTests.m
//  MVVMBinderUseReactiveCocoaTests
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ShowCaseViewModel.h"
#import <Kiwi/Kiwi.h>


SPEC_BEGIN(MVVMBinderUseReactiveCocoaTests)

describe(@"ShowCaseViewModel", ^{
    __block ShowCaseViewModel *showCaseVM;

    beforeEach(^{
        showCaseVM = [[ShowCaseViewModel alloc] initWithTitle:@"showCase"];
        showCaseVM.isActive = YES;
    });
    
    afterEach(^{
        showCaseVM = nil;
    });

    
    context(@"when executing loadDataCommand", ^{
        __block RACSignal *loadDataSignal;
        beforeEach(^{
            loadDataSignal = [showCaseVM.loadDataCommand execute:nil];
        });
        
       
        it(@"page Title", ^{
            [[expectFutureValue(showCaseVM.pageTitle) shouldEventually] equal:@"showCase"];
        });
        
        
        __block BOOL successful = NO;
        __block NSError *error = nil;
        it(@"datas will not be nil", ^{
            [loadDataSignal asynchronousFirstOrDefault:nil success:&successful error:&error];
            successful = [loadDataSignal asynchronouslyWaitUntilCompleted:&error];
            [[expectFutureValue(showCaseVM.datas) shouldNotEventually] equal:nil];
            [[expectFutureValue(@(successful)) shouldEventually] equal:@YES];
        });
        
       
    });
});
SPEC_END