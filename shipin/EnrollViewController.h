//
//  EnrollViewController.h
//  shipin
//
//  Created by 乐知学院 on 15/8/11.
//  Copyright (c) 2015年 乐知学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnrollViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bian;
@property (weak, nonatomic) IBOutlet UIView *oneView;
- (IBAction)category:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *category;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;
@property (weak, nonatomic) IBOutlet UITextField *numberNear;
@property (weak, nonatomic) IBOutlet UITextField *land;
@property (weak, nonatomic) IBOutlet UITextField *numberphone;
@property (weak, nonatomic) IBOutlet UISegmentedControl *column;
@property (weak, nonatomic) IBOutlet UITextField *introduction;
- (IBAction)selfAV:(id)sender;
- (IBAction)OK:(id)sender;

@end
