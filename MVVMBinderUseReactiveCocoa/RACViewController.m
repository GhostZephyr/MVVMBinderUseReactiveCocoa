////
////  RACViewController.m
////  MVVMBinderUseReactiveCocoa
////
////  Created by gz on 16/6/3.
////  Copyright © 2016年 gz. All rights reserved.
////
//
//#import "RACViewController.h"
//
//@implementation RACViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    @weakify(self);
//    
//    RAC(self.logInButton, enabled) = [RACSignal
//                                      combineLatest:@[
//                                                      self.usernameTextField.rac_textSignal,
//                                                      self.passwordTextField.rac_textSignal,
//                                                      RACObserve(LoginManager.sharedManager, loggingIn),
//                                                      RACObserve(self, loggedIn)
//                                                      ] reduce:^(NSString *username, NSString *password, NSNumber *loggingIn, NSNumber *loggedIn) {
//                                                          return @(username.length > 0 && password.length > 0 && !loggingIn.boolValue && !loggedIn.boolValue);
//                                                      }];
//    
//    [[self.logInButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
//        @strongify(self);
//        
//        RACSignal *loginSignal = [LoginManager.sharedManager
//                                  logInWithUsername:self.usernameTextField.text
//                                  password:self.passwordTextField.text];
//        
//        [loginSignal subscribeError:^(NSError *error) {
//            @strongify(self);
//            [self presentError:error];
//        } completed:^{
//            @strongify(self);
//            self.loggedIn = YES;
//        }];
//    }];
//    
//    RAC(self, loggedIn) = [[NSNotificationCenter.defaultCenter
//                            rac_addObserverForName:UserDidLogOutNotification object:nil]
//                           mapReplace:@NO];
//}
//
//@end
