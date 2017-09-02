//
//  User.m
//  Ribbit
//
//  Created by Amit Bijlani on 8/24/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "User.h"

static NSInteger identifier = 1;

@interface User()
@property (strong,nonatomic) NSMutableArray *friendsMutable;
@end

@implementation User

+ (instancetype) currentUser {
  static User *sharedUser = nil;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedUser = [[self alloc] init];
    sharedUser.username = @"";
    sharedUser.objectId = @"";
    sharedUser.friendsMutable = [NSMutableArray array];
  });
  
  return sharedUser;
}

+ (instancetype)userWithUsername:(NSString*)username {
  User *user = [[self alloc] init];
  if ( user ) {
    user.username = username;
    user.objectId = [NSString stringWithFormat:@"%ld",(long)++identifier];
  }
  return user;
}

- (void)addFriend:(User *)friend {
  [self.friendsMutable addObject:friend];
}

- (void)removeFriend:(User *)friend {
  if ([self.friends containsObject:friend]) {
    [self.friendsMutable removeObject:friend];
  }
}

- (NSArray*) friends {
  return self.friendsMutable;
}


@end
