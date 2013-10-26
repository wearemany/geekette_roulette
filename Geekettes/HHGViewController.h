//
//  HHGViewController.h
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHGViewController : UIViewController

@property (nonatomic, retain) NSString *path;
@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) IBOutlet UITextField *nameLabel;
@property (nonatomic, retain) IBOutlet UITextField *professionLabel;
@property (nonatomic, retain) IBOutlet UITextField *placeLabel;
@property (nonatomic, retain) IBOutlet UITextField *twitterLabel;
@property (nonatomic, retain) IBOutlet UITextField *emailLabel;
@property (nonatomic, retain) IBOutlet UIImageView *userPhoto;
@property (nonatomic, retain) IBOutlet UITextView *interests;

- (IBAction)connectviaxing:(id)sender;
- (IBAction)playsound:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)logout:(id)sender;
@end
