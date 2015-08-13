//
//  StarsCollectionHeaderView.h
//  shipin
///Users/lezhixueyuan1/Desktop/shipin/shipin/ChiDCollectionViewCell.h
//  Created by 乐知学院 on 15/8/10.
//  Copyright (c) 2015年 乐知学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarsCollectionHeaderView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIButton *a;
@property (weak, nonatomic) IBOutlet UIButton *B;
@property (weak, nonatomic) IBOutlet UIButton *C;
@property (weak, nonatomic) IBOutlet UIButton *d;
- (IBAction)B:(id)sender;
- (IBAction)C:(id)sender;
- (IBAction)D:(id)sender;

@end
