//
//  ShowCaseCellNode.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/3.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ShowCaseCellNode : ASTextCellNode

- (void)setData:(RACTuple *)tupleData;

@end
