//
//  HHGProfileViewController.m
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGProfileViewController.h"
#import "XNGAPIClient+ContactRequests.h"
#import "XNGAPIClient+Messages.h"
#import "XNGAPIClient+Userprofiles.h"

@interface HHGProfileViewController ()
{
    NSString* _name;
    NSString* _place;
    NSString* _email;
    NSString* _interestslabel;
    UIImage* _image;
    NSString* _twitter;
    NSString* _profession;
}

@end

@implementation HHGProfileViewController

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
    [_nameLabel setText:_name];
    if(![_place isEqual: [NSNull null]])
    [_placeLabel setText:_place];
    [_emailLabel setText:_email];
    [_userPhoto setImage:_image];
    [_userPhoto.layer setCornerRadius:15.0];
    _userPhoto.clipsToBounds = YES;
    [_interests setFont:[UIFont fontWithName:@"Lato-Regularr" size:12]];
    if(![_interestslabel isEqual: [NSNull null]])
    [_interests setText:_interestslabel];
    [_nameLabel setFont:[UIFont fontWithName:@"Lato-Bold" size:16]];
    [_professionLabel setText:_profession];
}

- (void)setupWithName:(NSString*)name place:(NSString*)place email:(NSString*)email image:(UIImage*)image interests:(NSString*)interests twitter:(NSString*)twitter userID:(NSString*)userID profession:(NSString*)profession;
{
    _name = name;
    _place = place;
    _image = image;
    _email = email;
    _interestslabel = interests;
    _twitter = twitter;
    _userID = userID;
    _profession = profession;
}

- (IBAction)connectviaxing:(id)sender
{
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    [client postCreateContactRequestToUserWithID:_userID
                                         message: [NSString stringWithFormat:@"Hey,\n\n I saw you on We are many and wanted to connect with you on Xing.\n\n Greetings %@",_nameLabel.text]
                                         success:^(NSDictionary* dict){
                                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sent"
                                                                                             message:@"Your contactrequest has been sent."
                                                                                            delegate:nil
                                                                                   cancelButtonTitle:@"OK"
                                                                                   otherButtonTitles:nil];
                                             [alert show];
//                                             [_connectviaxingButton setTitle:@"request sent" forState: UIControlStateNormal];
//                                             [_connectviaxingButton setEnabled:NO];
                                         }
                                         failure:^(NSError *error){
                                            NSLog(@"failed %@", error);
                                         }];
}
- (IBAction)next:(id)sender
{
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://boiling-depths-9831.herokuapp.com/geekettes.json"]
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
//                                                       timeoutInterval:10];
//    
//    [request setHTTPMethod: @"GET"];
//    
//    NSError *requestError;
//    NSURLResponse *urlResponse = nil;
//    NSData *response1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
//
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main"
//                                                 bundle:nil];
//    HHGProfileViewController* profile = [sb instantiateViewControllerWithIdentifier:@"yourProfile"];
//    NSArray* json = [NSJSONSerialization
//                          JSONObjectWithData:response1
//                          
//                          options:kNilOptions
//                          error:&requestError];
//    
//    NSDictionary *users = json[2];
// //   NSDictionary *daten = users[0];
//    NSDictionary *photoUrls = users[@"photo_urls"];
////    NSMutableData *data = [[NSMutableData alloc] init];
////    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
////    [archiver encodeObject:photoUrls forKey:@"Some Key Value"];
////    [archiver finishEncoding];
//    
//    NSData* json2 = [NSJSONSerialization
//                     dataWithJSONObject: photoUrls
//                     
//                     options:kNilOptions
//                     error:&requestError];
//    
//    NSDictionary* json3 = [NSJSONSerialization
//                     JSONObjectWithData:json2
//                     
//                     options:kNilOptions
//                     error:&requestError];
//    
//    NSURL *url = [NSURL URLWithString:json3[@"large"]];
//    NSData *data2 = [NSData dataWithContentsOfURL:url];
//    UIImage *img = [[UIImage alloc] initWithData:data2];
//    [profile setupWithName:[NSString stringWithFormat:@"%@ %@",users[@"first_name"], users[@"last_name"]] place:users[@"business_city"] email:users[@"email"] image:img interests:users[@"interests"] twitter:users[@"urls"][@"twitter"] userID:users[@"external_ids"] profession:@""/*users[@"professional_experience"][@"title"]*/];
//    
//    //[profile setupWithName:_nameLabel.text place:_placeLabel.text email:_emailLabel.text image:_userPhoto.image interests:_interests.text twitter:_twitterLabel.text userID:_userID profession:_professionLabel.text];
//    [self.navigationController pushViewController:profile animated:YES];
//    
//    //http://boiling-depths-9831.herokuapp.com/geekettes.json
    
    NSArray *names = @[@"Diana_Knodel", @"Tina_Egolf",@"Sabela_Garcia" @"Denise_Philipp3", @"Theresa_Grotendorst", @"Karile_Klug", @"Irina_Balko", @"Sabella_Hastreiter2", @"Mariya_Berndt", @"Susanne_Kaiser2"];
    int x = arc4random() % 9;
    NSString *temp = names[x];

    XNGAPIClient *client = [XNGAPIClient sharedClient];
    [client getUserWithID:temp
               userFields:nil
                  success:^(NSDictionary *dict){
                      UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main"
                                                                   bundle:nil];
                      HHGProfileViewController* profile = [sb instantiateViewControllerWithIdentifier:@"yourProfile"];
                      NSArray *users = dict[@"users"];
                      NSDictionary *daten = users[0];
                      NSURL *url = [NSURL URLWithString:daten[@"photo_urls"][@"large"]];
                      NSData *data = [NSData dataWithContentsOfURL:url];
                      UIImage *img = [[UIImage alloc] initWithData:data];
                      [profile setupWithName:daten[@"display_name"] place:daten[@"business_address"][@"city"] email:daten[@"active_email"] image:img interests:daten[@"interests"] twitter:daten[@"twitter"] userID:daten[@"page_name"] profession:daten[@"professional_experience"][@"primary_company"][@"title"]];
                      [self.navigationController pushViewController:profile animated:YES];
                    
                  }
                  failure:^(NSError *error) {
                      // handle failure
                  }];
    
}

- (IBAction) mail:(id)sender
{
    NSString *recipients = [NSString stringWithFormat:@"mailto:%@",_email];
    
    NSString *body = @"&body=It is raining in sunny California!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}
@end
