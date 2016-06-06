//
//  ShowCaseCellNode.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/3.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ShowCaseCellNode.h"

@interface ShowCaseCellNode()

@property (nonatomic, strong) ASNetworkImageNode *imgNode;

@end

@implementation ShowCaseCellNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imgNode = [[ASNetworkImageNode alloc] init];
        self.imgNode.frame = CGRectMake(0, 0, 50, 50);
        self.imgNode.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.imgNode.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubnode:self.imgNode];
    }
    return self;
}


- (void)setData:(RACTuple *)tupleData {
    RACTupleUnpack(NSString *title, NSString *imgURL) = tupleData;
    self.text = title;
    imgURL = @"http://a2.files.theultralinx.com/image/upload/MTI5MDU2ODM2MjQxNDI5Nzc4.gif";
    self.imgNode.URL = [NSURL URLWithString:imgURL];
    
}

@end
