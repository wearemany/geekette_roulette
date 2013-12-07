//
//  HHGProfileViewController.m
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGProfileViewController.h"
#import "HHGAPI.h"
#import "XNGAPIClient+ContactRequests.h"
#import "XNGAPIClient+Messages.h"
#import "XNGAPIClient+Userprofiles.h"
#import <QuartzCore/QuartzCore.h>

@interface HHGProfileViewController ()
{
    HHGUser *_user;
    NSMutableArray *_users;
}

@end

@implementation HHGProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setup
{
    if(_user == nil) {
        //we came directly here because the user is logged in
        [self next:nil];
    } else {
        [_nameLabel setText:_user.name];
        if(![_user.place isEqual: [NSNull null]])
            [_placeLabel setText:_user.place];
        [_emailLabel setText:_user.email];
        [_userPhoto setImage:_user.profilePicture];
        [_userPhoto.layer setCornerRadius:_userPhoto.frame.size.width / 2.0];
        _userPhoto.clipsToBounds = YES;
        _userPhoto.layer.masksToBounds = YES;
        [_interests setFont:[UIFont fontWithName:@"Lato-light" size:12]];
        if(![_user.interests isEqual: [NSNull null]])
            [_interests setText:_user.interests];
        [_nameLabel setFont:[UIFont fontWithName:@"Lato-Bold" size:16]];
        [_professionLabel setText:_user.profession];
    }
    if (!_users)
        _users = [[NSMutableArray alloc] init];
}

- (void)setupWithUser:(HHGUser *)user
{
    _user = user;
}

- (IBAction)connectviaxing:(id)sender
{
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    //TODO:Localize
    [client postCreateContactRequestToUserWithID:_userID
                                         message: [NSString stringWithFormat:@"Hey,\n\n I saw you on We are many and wanted to connect with you on Xing.\n\n Greetings %@",_nameLabel.text]
                                         success:^(NSDictionary* dict){
                                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sent"
                                                                                             message:@"Your contactrequest has been sent."
                                                                                            delegate:nil
                                                                                   cancelButtonTitle:@"OK"
                                                                                   otherButtonTitles:nil];
                                             [alert show];

                                         }
                                         failure:^(NSError *error){
                                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                             message:@"There was an Error sending your contact request"
                                                                                            delegate:nil
                                                                                   cancelButtonTitle:@"OK"
                                                                                   otherButtonTitles:nil];
                                             [alert show];
                                            NSLog(@"failed %@", error);
                                         }];
}

- (IBAction)next:(id)sender
{
    // we need to have a request here that is querying 10 users and saves them in an array
    // when the request is done we get a callback with the data
    // if we only have another 3 to go to get the next ten in the background
    if([_users count] <= 3) {
        [HHGAPI queryUsersWithCallback:^(NSArray *users, NSError *error){
            if(error == nil){
                _users = [[NSMutableArray alloc] initWithArray:[_users arrayByAddingObjectsFromArray:users]];
            } else {
                //here fehlerbehandlung
            }
        }];
    }

    if([_users count] > 0) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HHGProfileViewController* profile = [sb instantiateViewControllerWithIdentifier:@"yourProfile"];
        [profile setupWithUser:_users[0]];
        [_users removeObjectAtIndex:0];

        [self.navigationController pushViewController:profile animated:YES];
    }

}

- (IBAction) mail:(id)sender
{
    NSString *recipients = [NSString stringWithFormat:@"mailto:%@",_user.email];
    
    NSString *body = @"&body=It is raining in sunny California!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}
@end
