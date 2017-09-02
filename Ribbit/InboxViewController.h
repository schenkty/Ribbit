//
//  InboxViewController.h
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@class Message;

@interface InboxViewController : UITableViewController

// Fixed bug so that the correct viewcontroller was setup
@property (nonatomic, strong) User *currentUser;

@property (nonatomic, strong) Message *selectedMessage;

// Fix - Added AVPlayer to replace the old MPMoviePlayerController
@property (nonatomic, strong) AVPlayer *moviePlayer;

- (IBAction)logout:(id)sender;

@end
