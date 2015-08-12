//
//  TableViewCell.h
//  shipin/Users/lezhixueyuan1/Desktop/shipin/shipin/TableViewCell.h
//
//  Created by 乐知学院 on 15/8/12.
//  Copyright (c) 2015年 乐知学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *uiView;
@property (weak, nonatomic) IBOutlet UIButton *touPiao;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIImageView *userMan;
@property (weak, nonatomic) IBOutlet UIButton *guanZhu;
@property (weak, nonatomic) IBOutlet UILabel *pingLunS;




@end
