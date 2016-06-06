
//
//  ShowCaseTableViewCell.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/2.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseTableViewCell.h"

@implementation ShowCaseTableViewCell

- (void)setData:(RACTuple *)tupleData {
    RACTupleUnpack(NSString *title, NSString *imgURL) = tupleData;
    self.textLabel.text = title;
    imgURL = @"http://a2.files.theultralinx.com/image/upload/MTI5MDU2ODM2MjQxNDI5Nzc4.gif";
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imgURL]];

}

@end
