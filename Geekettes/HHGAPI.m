//
//  HHGAPI.m
//  Geekettes
//
//  Created by Work account on 04/11/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGAPI.h"
#import "AFHTTPClient.h"

@implementation HHGAPI

+ (void)createUserWithUserObject:(HHGUser*)user callback:(void (^)(HHGUser *user, NSError *error))callback
{
    //TODO: write into proper variable
    NSURL *url = [NSURL URLWithString:@"http://boiling-depths-9831.herokuapp.com"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];

    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            user.name, @"user[name]",
                            user.place, @"user[place]",
                            user.email, @"user[email]",
                            user.twitter, @"user[twitter]",
                            user.profilePicture, @"user[imagepath]",
                            user.interests, @"user[interests]",
                            user.userID,@"user[id]",
                            user.profession, @"user[profession]",
                            nil];

    [httpClient getPath:@"/import" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //TODO:implement method
        callback([HHGUser userWithReponseObject:responseObject],nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(nil,error);
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];

}

+ (void)queryUsersWithCallback:(void (^)(NSArray *users, NSError *error))callback
{
    NSURL *url = [NSURL URLWithString:@"http://boiling-depths-9831.herokuapp.com"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];

    [httpClient getPath:@"/users" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //TODO:implement method

        callback([HHGUser usersWithResponseObject:responseObject],nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(nil,error);
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];

}
@end
