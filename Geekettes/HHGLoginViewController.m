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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.title = @"Geekettes Login";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginViaXing:(id)sender
{
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    client.consumerKey = @"6a72b7a5fa3bbdf9864c";
    client.consumerSecret = @"e8d8427a9340643c34dfed9a0ae34fb3c5a52328";
    if(!client.isLoggedin) {
        [client loginOAuthWithSuccess:^{
            [self performSegueWithIdentifier:@"segOne" sender:self];
        } failure:^(NSError *error) {
                                  // handle failure
        }];
    } else {
        [self performSegueWithIdentifier:@"segOne" sender:self];
    }
   
}

@end
