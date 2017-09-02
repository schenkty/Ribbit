//
//  Message.h
//  Ribbit
//
//  Created by Amit Bijlani on 8/25/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@class File;

@interface Message : NSObject

@property (strong, nonatomic) File *file;
@property (strong, nonatomic) NSArray *recipients;

@property (copy, nonatomic) NSString *fileType;
@property (copy, nonatomic) NSString *senderId;
@property (copy, nonatomic) NSString *senderName;

- (void)saveInBackgroundWithBlock:(BooleanResultBlock)block;

@end
