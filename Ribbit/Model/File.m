//
//  File.m
//  Ribbit
//
//  Created by Amit Bijlani on 8/25/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "File.h"

NSString * const CacheDirectoryName = @"ribbit-cache";


@implementation File

+ (instancetype)fileWithName:(NSString*)filename data:(NSData*)fileData {
  File *file = [[File alloc] init];
  file.filename = filename;
  file.data = fileData;
  
  return file;
}

#pragma mark - Public methods

- (void)saveInBackgroundWithBlock:(BooleanResultBlock)block {
  [self.data writeToFile:[self filePath] atomically:YES];
  block(YES,nil);
}

- (NSURL*)fileURL {
  return [NSURL fileURLWithPath:self.filename];
}


#pragma mark - Private methods

- (NSString*)filePath {
  return [[[self class] appCacheDirectory] stringByAppendingPathComponent:self.filename];
}

//
// returns the App Cache directory as a String
// it also checks if the directory exists if not it creates the it
//
+ (NSString*)appCacheDirectory {
  NSString *directory = [[self systemCacheDirectory]
                         stringByAppendingPathComponent:CacheDirectoryName];
  
  // create directory if it has not been created
  [self createCacheDirectory:directory];
  
  return directory;
}


+ (NSString *)systemCacheDirectory {
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
  NSString *cachesDirectory = [paths objectAtIndex:0];
  return cachesDirectory;
}

+ (void) createCacheDirectory:(NSString*)directory {
  
  if (![[NSFileManager defaultManager]  fileExistsAtPath:directory]) {
    NSDictionary *attributes = @{ NSURLIsExcludedFromBackupKey: @YES };
    [[NSFileManager defaultManager] createDirectoryAtPath:directory
                              withIntermediateDirectories:NO
                                               attributes:attributes error:nil];
  }
}


@end
