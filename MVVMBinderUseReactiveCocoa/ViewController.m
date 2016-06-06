//
//  ViewController.m
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/1.
//  Copyright © 2016年 gz. All rights reserved.
//

#import "ViewController.h"
#import "ShowCaseViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnShowCase;
@property (weak, nonatomic) IBOutlet UIButton *btnNormalView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (IBAction)toNormalShowCase:(id)sender {
    if ([sender isEqual:self.btnShowCase]) {
        [self toViewControllerWithType:ShowCaseViewType_Normal];
    } else {
        [self toViewControllerWithType:ShowCaseViewType_Node];
    }
    
}

- (void)toViewControllerWithType:(ShowCaseViewType)type {
    ShowCaseViewController *viewController = [[ShowCaseViewController alloc] initWithType:type];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
