//
//  EnrollViewController.m
//  shipin
//
//  Created by 乐知学院 on 15/8/11.
//  Copyright (c) 2015年 乐知学院. All rights reserved.
//

#import "EnrollViewController.h"

@interface EnrollViewController ()

@end

@implementation EnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSegmentedControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initSegmentedControl
{
    [[_category layer] setCornerRadius:5.0f];
    [[_category layer] setMasksToBounds:YES];
    _category.tintColor = [UIColor redColor];
    _category.selectedSegmentIndex = 0;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil,nil];
    
    
    [_category setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    [_category setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    }
//-(void)doSomethingInSegment:(UISegmentedControl *)Seg
//{
//    
//    NSInteger Index = Seg.selectedSegmentIndex;
//    
//    switch (Index)
//    {
//        case 0:
//            self.bian.hidden = NO;
//            self.oneView.hidden=YES;
//            break;
//        case 1:
//            self.bian.hidden = YES;
//            self.oneView.hidden=NO;
//            break;
//        default:
//            break;
//    }
//}
- (IBAction)category:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        self.bian.hidden = NO;
        self.oneView.hidden=YES;
        self.cSPAV.hidden=YES;
    }
    else if([sender selectedSegmentIndex]==1){
        self.bian.hidden = YES;
        self.oneView.hidden=NO;
        self.cSPAV.hidden=YES;
    }else{
        self.bian.hidden = YES;
        self.oneView.hidden=YES;
        self.cSPAV.hidden=NO;
    }
}
- (IBAction)selfAV:(id)sender {
}
- (IBAction)selfAVT:(id)sender {
}
@end
