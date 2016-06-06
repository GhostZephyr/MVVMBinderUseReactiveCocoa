//
//  ShowCaseTableViewCell.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/2.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCaseTableViewCell : UITableViewCell

- (void)setData:(RACTuple *)tupleData;

@end
