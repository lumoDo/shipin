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
- (IBAction)next:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextView *text;

@property (weak, nonatomic) IBOutlet UIView *cSPAV;
@property (weak, nonatomic) IBOutlet UISegmentedControl *category;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;
- (IBAction)sex:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *numberNear;
@property (weak, nonatomic) IBOutlet UITextField *land;
@property (weak, nonatomic) IBOutlet UITextField *numberphone;
- (IBAction)OK:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *OK;
@property (weak, nonatomic) IBOutlet UIButton *xButton;
@property (weak, nonatomic) IBOutlet UITextField *introduction;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UITextField *idCard;
@property (weak, nonatomic) IBOutlet UILabel *sexLable;
@property (weak, nonatomic) IBOutlet UITextField *mySize;


@property (weak, nonatomic) IBOutlet UISegmentedControl *column;
- (IBAction)selfAVX:(id)sender;
- (IBAction)selfAVT:(id)sender;
- (IBAction)selfMT:(id)sender;
- (unsigned long long)fileSize;

- (NSDate *)fileModificationDate;

- (NSString *)fileType;



@end
