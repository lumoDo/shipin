//
//  AvenueofastarsCollection.m
//  shipin
//
//  Created by 乐知学院 on 15/8/10.
//  Copyright (c) 2015年 乐知学院. All rights reserved.
//

#import "AvenueofastarsCollection.h"
#import "StarsCollectionHeaderView.h"
#import "AvenuefaCollectionViewCell.h"
@interface AvenueofastarsCollection ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    __block NSArray* listArr;
    
}
@end

@implementation AvenueofastarsCollection

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel* author=(UILabel*)[self.view viewWithTag:100];
    [[author layer] setCornerRadius:5.0f];
    [[author layer] setMasksToBounds:YES];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size=CGSizeZero;
    size=CGSizeMake(([UIScreen mainScreen].bounds.size.width-32)/2, 220);

    return size;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        
        StarsCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        [[headerView.a layer] setCornerRadius:5.0f];
        [[headerView.a layer] setMasksToBounds:YES];
        [[headerView.B layer] setCornerRadius:5.0f];
        [[headerView.B layer] setMasksToBounds:YES];
        [[headerView.C layer] setCornerRadius:5.0f];
        [[headerView.C layer] setMasksToBounds:YES];
        [[headerView.d layer] setCornerRadius:5.0f];
        [[headerView.d layer] setMasksToBounds:YES];
        reusableview=headerView;
        
    }
    return reusableview;
}


////cell
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        AvenuefaCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    AvenuefaCollectionViewCell *cell = (AvenuefaCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    cell.userImage.image=[UIImage imageNamed:@"a.png"];

    cell.dianZ.text=@"123485";

    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    //模态方式显示控制器
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size=CGSizeZero;
    size=CGSizeMake(([UIScreen mainScreen].bounds.size.width-32)/2, 203);
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets edgeInsets=UIEdgeInsetsMake(8, 8, 0, 8);
    return edgeInsets;
}
#pragma mark <UICollectionViewDelegate>



@end
