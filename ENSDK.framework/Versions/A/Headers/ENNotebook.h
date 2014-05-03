//
//  ENNotebook.h
//  evernote-sdk-ios
//
//  Created by Ben Zotto on 2/25/14.
//  Copyright (c) 2014 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENNotebook : NSObject <NSCoding>
@property (nonatomic, readonly) NSString * name;
@property (nonatomic, readonly) NSString * ownerDisplayName;
@property (nonatomic, readonly) BOOL allowsWriting;
@property (nonatomic, readonly) BOOL isShared;
@property (nonatomic, readonly) BOOL isBusinessNotebook;
@property (nonatomic, readonly) BOOL isOwnedByUser;
@property (nonatomic, readonly) BOOL isDefaultNotebook;
@end
