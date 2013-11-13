//
//  HHGAPI.h
//  Geekettes
//
//  Created by Work account on 04/11/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGUser.h"

@interface HHGAPI : NSObject

+ (void)createUserWithUserObject:(HHGUser*)user callback:(void (^)(HHGUser *user, NSError *error))callback;

+ (void)queryUsersWithCallback:(void (^)(NSArray *users, NSError *error))callback;

@end
