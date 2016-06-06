
//
//  ShowCaseViewModelService.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseViewModelService.h"

@implementation ShowCaseViewModelService

- (RACSignal *)fetchDataWithParam:(NSString *)param {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"q":@"帅哥"} progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"progress:%@", downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 在这里就可以拿到数据，将其丢出去
            NSArray *dictArr = responseObject[@"books"];
            // 便利books字典数组，将其映射为模型数组
            NSArray *modelArr = [[dictArr.rac_sequence map:^id(NSDictionary *value) {
                return RACTuplePack(value[@"title"], value[@"image"]);
            }] array];
            
            [subscriber sendNext:modelArr];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"释放");
        }];
    }];
}

@end
