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
    
// 
//    /*
//     这个是设置按下按钮时的颜色
//     */
    [[_category layer] setCornerRadius:5.0f];
    [[_category layer] setMasksToBounds:YES];
    _category.tintColor = [UIColor redColor];

    _category.selectedSegmentIndex = 0;//默认选中的按钮索引
//
//    
//    /*
//     下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
//     */
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil,nil];
    
    
    [_category setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    [_category setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
//    //设置分段控件点击相应事件
//    [_category addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
//    
//    [self.view addSubview:_category];
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
    }
    else {
        self.bian.hidden = YES;
        self.oneView.hidden=NO;
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selfAV:(id)sender {
}

- (IBAction)OK:(id)sender {
}

@end
