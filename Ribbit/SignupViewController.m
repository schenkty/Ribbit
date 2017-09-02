//
//  SignupViewController.m
//  Ribbit
//
//  Created by Ben Jakuben on 7/30/13.
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import "SignupViewController.h"
#import "User.h"
#import "InboxViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Add gesture recognizer to hide keyboard
    UITapGestureRecognizer *imageGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    [self.view addGestureRecognizer:imageGestureRecognizer];
}

//Hide keyboard when view is tapped
-(void)viewTapped {
    
    [self.view endEditing:true];
}

- (IBAction)signup:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {
        
        // Fix - Updated to use the UIAlertController
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"Make sure you enter a username, password, and email address!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        
        [self presentViewController:alert animated:true completion:nil];
    }
    else {
        User *newUser = [User currentUser];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;
        
        InboxViewController *inboxVc = [[InboxViewController alloc] init];
        inboxVc.currentUser = newUser;
        
//        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
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
