//
//  HHGViewController.m
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGViewController.h"
#import "XNGAPIClient+UserProfiles.h"
#import "HHGProfileViewController.h"

@interface HHGViewController ()

@end

@implementation HHGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setup
{
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    [client getUserWithID:@"me"
               userFields:nil
                  success:^(NSDictionary *dict){
                      //NSDictionary *jsonObject = dict;
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

- (IBAction)save;
{
    NSURL *url = [NSURL URLWithString:@"http://boiling-depths-9831.herokuapp.com"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            _nameLabel.text, @"user[name]",
                            _placeLabel.text, @"user[place]",
                            _emailLabel.text, @"user[email]",
                            _twitterLabel.text, @"user[twitter]",
                            _path, @"user[imagepath]",
                            _interests.text, @"user[interests]",
                            _userID,@"user[id]",
                            _professionLabel.text, @"user[profession]",
                            nil];
    [httpClient getPath:@"/import" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
     //   NSLog(@"Request Successful, response '%@'", responseStr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main"
                              bundle:nil];
    HHGProfileViewController* profile = [sb instantiateViewControllerWithIdentifier:@"yourProfile"];
    
    [profile setupWithName:_nameLabel.text place:_placeLabel.text email:_emailLabel.text image:_userPhoto.image interests:_interests.text twitter:_twitterLabel.text userID:_userID profession:_professionLabel.text];
    [self.navigationController pushViewController:profile animated:YES];
    //call fürs backend
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
