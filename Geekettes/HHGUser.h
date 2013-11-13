//
//  HHGUser.h
//  Geekettes
//
//  Created by Work account on 09/11/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//



@interface HHGUser : NSObject

@property (nonatomic, copy) NSString *email;
@property (nonatomic) NSNumber *loggedInViaXing;
@property (nonatomic, copy) NSString* place;
@property (nonatomic, copy) NSString* interests;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString* twitter;
@property (nonatomic, copy) NSString* profession;
@property (nonatomic) UIImage* profilePicture;
@property (nonatomic) NSString* userID;

+ (HHGUser *)userWithReponseObject:(id)responseObject;
+ (NSArray *)usersWithResponseObject:(id)responseObject;
//- (BOOL)isLoggedInViaXing;

@end








