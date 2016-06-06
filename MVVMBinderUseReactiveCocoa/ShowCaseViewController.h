//
//  ShowCaseViewController.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/2.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ShowCaseViewType_Normal,
    ShowCaseViewType_Node,
} ShowCaseViewType;

@interface ShowCaseViewController : UIViewController

- (instancetype)initWithType:(ShowCaseViewType)type;

@end
