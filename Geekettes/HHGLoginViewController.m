//
//  HHGLoginViewController.m
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGLoginViewController.h"
#import "HHGViewController.h"
#import "XNGAPIClient.h"

@interface HHGLoginViewController ()

@end

@implementation HHGLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
<<<<<<< HEAD
        // Custom initialization
=======
>>>>>>> code cleanup, seperate files for api calls, alerts for failed calls
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
    self.navigationController.title = @"Geekettes Login";
    // Do any additional setup after loading the view from its nib.
=======
    //TODO: Localize
    self.navigationController.title = @"Geekettes Login";
>>>>>>> code cleanup, seperate files for api calls, alerts for failed calls
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
<<<<<<< HEAD
    // Dispose of any resources that can be recreated.
=======
>>>>>>> code cleanup, seperate files for api calls, alerts for failed calls
}

- (IBAction)loginViaXing:(id)sender
{
<<<<<<< HEAD
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    client.consumerKey = @"6a72b7a5fa3bbdf9864c";
    client.consumerSecret = @"e8d8427a9340643c34dfed9a0ae34fb3c5a52328";
=======
    //TODO the user shouldn't have to click the button before seeing other geekettes
    XNGAPIClient *client = [XNGAPIClient sharedClient];
>>>>>>> code cleanup, seperate files for api calls, alerts for failed calls
    if(!client.isLoggedin) {
        [client loginOAuthWithSuccess:^{
            [self performSegueWithIdentifier:@"segOne" sender:self];
        } failure:^(NSError *error) {
<<<<<<< HEAD
                                  // handle failure
=======
          //TODO: Localize
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"something went wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
>>>>>>> code cleanup, seperate files for api calls, alerts for failed calls
        }];
    } else {
        [self performSegueWithIdentifier:@"segOne" sender:self];
    }
   
}

@end
