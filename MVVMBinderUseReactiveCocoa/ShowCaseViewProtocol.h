//
//  ShowCaseViewProtocol.h
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowCaseViewModelProtocol.h"

@protocol ShowCaseViewProtocol <NSObject>

/**
 *  附加
 *
 *  @param rootView <#rootView description#>
 */
- (void)attach:(UIView *)rootView;

/**
 *  卸载
 */
- (void)dettach;

@optional

- (void)attach:(UIView *)rootView parentController:(UIViewController *)controller;

- (void)attach:(UIView *)rootView parentController:(UIViewController *)controller navigator:(UINavigationController *)navigator;

/**
 *  绑定到指定的ViewModel后会展示其数据
 *
 *  @param viewModel <#viewModel description#>
 */
- (void)bindToViewModel:(id<ShowCaseViewModelProtocol>)viewModel;

- (UIView *)viewWithFrame:(CGRect)frame;

- (UIView *)viewForAutolayout;

@end
