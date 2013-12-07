//
//  HHGUser.m
//  Geekettes
//
//  Created by Work account on 09/11/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGUser.h"

@implementation HHGUser

+ (HHGUser *)userWithReponseObject:(id)responseObject
{
    HHGUser *user = [[HHGUser alloc] init];
    NSDictionary *dataObject = responseObject;
    
    user.name = dataObject[@"display_name"];
    user.email = dataObject[@"active_email"];
    user.interests = dataObject[@"interests"];
    user.profession = dataObject[@"professional_experience"][@"title"];
    user.place = dataObject[@"city"];
    user.twitter = dataObject[@"twitter"];
    user.userID = dataObject[@"id"];
    
    return user;
}

+ (NSArray *)usersWithResponseObject:(id)responseObject
{
    NSDictionary *dataObject = responseObject[@"users"];
    NSMutableArray *users = [[NSMutableArray alloc] init];
    for(NSDictionary *data in dataObject){
        [users addObject: [self userWithReponseObject:data]];
    }
    return users;
}

@end
