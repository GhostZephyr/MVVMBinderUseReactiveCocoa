////
////  NormalViewController.m
////  MVVMBinderUseReactiveCocoa
////
////  Created by gz on 16/6/3.
////  Copyright © 2016年 gz. All rights reserved.
////
//
//#import "NormalViewController.h"
//
//@interface NormalViewController()
//
//
//
//@end
//
//@implementation NormalViewController
//
//static void *ObservationContext = &ObservationContext;
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [LoginManager.sharedManager addObserver:self forKeyPath:@"loggingIn" options:NSKeyValueObservingOptionInitial context:&ObservationContext];
//    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(loggedOut:) name:UserDidLogOutNotification object:LoginManager.sharedManager];
//    
//    [self.usernameTextField addTarget:self action:@selector(updateLogInButton) forControlEvents:UIControlEventEditingChanged];
//    [self.passwordTextField addTarget:self action:@selector(updateLogInButton) forControlEvents:UIControlEventEditingChanged];
//    [self.logInButton addTarget:self action:@selector(logInPressed:) forControlEvents:UIControlEventTouchUpInside];
//}
//
//- (void)dealloc {
//    [LoginManager.sharedManager removeObserver:self forKeyPath:@"loggingIn" context:ObservationContext];
//    [NSNotificationCenter.defaultCenter removeObserver:self];
//}
//
//- (void)updateLogInButton {
//    BOOL textFieldsNonEmpty = self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0;
//    BOOL readyToLogIn = !LoginManager.sharedManager.isLoggingIn && !self.loggedIn;
//    self.logInButton.enabled = textFieldsNonEmpty && readyToLogIn;
//}
//
//- (IBAction)logInPressed:(UIButton *)sender {
//    [[LoginManager sharedManager]
//     logInWithUsername:self.usernameTextField.text
//     password:self.passwordTextField.text
//     success:^{
//         self.loggedIn = YES;
//     } failure:^(NSError *error) {
//         [self presentError:error];
//     }];
//}
//
//- (void)loggedOut:(NSNotification *)notification {
//    self.loggedIn = NO;
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if (context == ObservationContext) {
//        [self updateLogInButton];
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
//}
//
//@end
