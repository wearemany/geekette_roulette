//
//  HHGProfileViewController.h
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHGUser.h"

@interface HHGProfileViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *placeLabel;
@property (nonatomic, retain) IBOutlet UILabel *twitterLabel;
@property (nonatomic, retain) IBOutlet UILabel *emailLabel;
@property (nonatomic, retain) IBOutlet UILabel *professionLabel;
@property (nonatomic, retain) IBOutlet UIImageView *userPhoto;
@property (nonatomic, retain) IBOutlet UITextView *interests;
@property (nonatomic, retain) IBOutlet UIButton *connectviaxingButton;
@property (nonatomic, retain) NSString* userID;

- (void)setupWithUser:(HHGUser *)user;

- (IBAction)connectviaxing:(id)sender;

- (IBAction)next:(id)sender;

@end
