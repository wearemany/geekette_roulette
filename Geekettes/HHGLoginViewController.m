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

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //TODO: Localize
    self.navigationController.title = @"Geekettes Login";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)loginViaXing:(id)sender
{

    //TODO the user shouldn't have to click the button before seeing other geekettes
    XNGAPIClient *client = [XNGAPIClient sharedClient];

    if(!client.isLoggedin) {
        [client loginOAuthWithSuccess:^{
            [self performSegueWithIdentifier:@"segOne" sender:self];
        } failure:^(NSError *error) {

          //TODO: Localize
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"something went wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }];
    } else {
        [self performSegueWithIdentifier:@"segOne" sender:self];
    }
   
}

@end
