//
//  App.h
//  Ribbit
//
//  Created by Amit Bijlani on 9/6/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@class Message;

@interface App : NSObject

//fix to bug so that friends do not display multiple times
@property(nonatomic, strong, readonly) NSArray<User *> *allUsers;

+ (instancetype) currentApp;
- (void) addMessage:(Message*)message;
- (void) deleteMessage:(Message*)message;
- (NSArray *) messages;

@end
