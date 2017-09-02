//
//  LoginViewController.m
//  Ribbit
//
//  Created by Ben Jakuben on 7/30/13.
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import "InboxViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.hidesBackButton = YES;
    
    //Add gesture recognizer to hide keyboard
    UITapGestureRecognizer *imageGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    [self.view addGestureRecognizer:imageGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

//Hide keyboard when view is tapped
-(void)viewTapped {
    
    [self.view endEditing:true];
}


- (IBAction)login:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0) {
        
        // Fix - Updated to use the UIAlertController
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"Make sure you enter a username, password, and email address!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        
        [self presentViewController:alert animated:true completion:nil];
    }
    else {
        
        User *currentUser = [User currentUser];
        currentUser.username = username;
        
        InboxViewController *inboxVc = [[InboxViewController alloc] init];
        inboxVc.currentUser = currentUser;
        
        [self.navigationController popToRootViewControllerAnimated: true];
        
//        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
//            if (error) {
//                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
//                                                                    message:[error.userInfo objectForKey:@"error"]
//                                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                [alertView show];
//            }
//            else {
                [self.navigationController popToRootViewControllerAnimated:YES];
//            }
//        }];
    }
}

@end
