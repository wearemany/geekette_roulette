//
//  HHGViewController.m
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGViewController.h"

#import "HHGUser.h"
#import "XNGAPIClient+UserProfiles.h"
#import "HHGProfileViewController.h"
#import "HHGAPI.h"

@interface HHGViewController ()

@end

@implementation HHGViewController

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
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    [client getUserWithID:@"me"
               userFields:nil
                  success:^(NSDictionary *dict){
                      NSArray *users = dict[@"users"];
                      NSDictionary *daten = users[0];
                      [_nameLabel setText:daten[@"display_name"]];
                      [_placeLabel setText:daten[@"business_address"][@"city"]];
                      [_emailLabel setText:daten[@"active_email"]];
                      [_professionLabel setText:daten[@"professional_experience"][@"title"]];
                      [self loadImageWithUrl:daten[@"photo_urls"][@"large"]];
                      [_interests setText:daten[@"interests"]];
                      [_twitterLabel setText:daten[@"twitter"]];
                      _userID = daten[@"page_name"];
                  }
                  failure:^(NSError *error) {
                      // handle failure
                  }];
    
}

- (IBAction)logout
{
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    [client logout];
}


- (IBAction)save:(id)sender
{
    HHGUser *user = [[HHGUser alloc] init];
    
    user.name = _nameLabel.text;
    user.place = _placeLabel.text;
    user.email = _emailLabel.text;
    user.profilePicture = _userPhoto.image;
    user.twitter = _twitterLabel.text;
    user.interests = _interests.text;
    user.userID =_userID;
    user.profession = _professionLabel.text;
    [HHGAPI createUserWithUserObject:user callback:^(HHGUser *user, NSError *error)
    {
        if (error == nil) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HHGProfileViewController* profile = [sb instantiateViewControllerWithIdentifier:@"yourProfile"];
            [profile setupWithUser:user];
            [self.navigationController pushViewController:profile animated:YES];
        } else {
            //TODO:write alert
        }
    }];
}

- (void)loadImageWithUrl:(NSString*)path
{
    NSURL *url = [NSURL URLWithString:path];
    _path = path;
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    [_userPhoto.layer setCornerRadius:15.0];
    _userPhoto.clipsToBounds = YES;
    [_userPhoto setImage:img];
}

@end
