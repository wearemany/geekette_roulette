//
//  HHGProfileViewController.h
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import <UIKit/UIKit.h>

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
- (void)setupWithName:(NSString*)name place:(NSString*)place email:(NSString*)email image:(UIImage*)image interests:(NSString*)interests twitter:(NSString*)twitter userID:(NSString*)userID profession:(NSString*)profession;
- (IBAction)connectviaxing:(id)sender;
- (IBAction)playsound:(id)sender;
- (IBAction)next:(id)sender;

@end
