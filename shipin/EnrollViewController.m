//
//  EnrollViewController.m
//  shipin
//
//  Created by 乐知学院 on 15/8/11.
//  Copyright (c) 2015年 乐知学院. All rights reserved.
//

#import "EnrollViewController.h"
#import "UserData.h"
#import "DeaultEncryptionToDecrypt.h"
#import "AvenueofastarsCollection.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import "EnterViewController.h"
#import "ShowStart.h"
#import "MBProgressHUD.h"
#import "ASProgressPopUpView.h"
#define UISCREENWEIGHT [[UIScreen mainScreen]bounds].size.width
@interface EnrollViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate,MBProgressHUDDelegate>{
    MBProgressHUD* HUD;
    UIView* markView;
    UIView* markView1;
    UIView* view;
    UIView *sv;
}
@property(strong,nonatomic) NSString* FilePath;
@property (assign,nonatomic) int isVideo;//是否录制视频，如果为1表示录制视频，0代表拍照
@property (strong,nonatomic) UIImagePickerController *imagePicker;
@property(strong,nonatomic) NSString* fileData;
@property (strong, nonatomic)UIActionSheet *MyActionSheet;
@property(strong,nonatomic)ASProgressPopUpView* progressView;
@end
static NSString *sexm=@"1";
static NSString *shC=@"1";
static NSString *sha=@"1";
static NSString *shb=@"1";
@implementation EnrollViewController
#pragma mark - 消失键盘
-(void)dismissKeyboard1
{
    NSArray *subviews = [self.oneView subviews];
    for (id objInput in subviews)
    {
        if ([objInput isKindOfClass:[UITextField class]])
        {
            UITextField *theTextField = objInput;
            if ([objInput isFirstResponder])
            {
                [theTextField resignFirstResponder];
                
            }
        }
    }
}
//进入页面调用
-(void)viewWillAppear:(BOOL)animated
{
    if(![DeaultEncryptionToDecrypt connectedToNetwork]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告"message:@"请检查您的设备是否联网" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        return;
    }
    [self cheng];
        UserData *UserId=[UserData userdata]; 
    if(UserId.loginState==YES){
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"您尚未登陆"message:@"是否立刻登陆？" delegate:self cancelButtonTitle:@"确定"otherButtonTitles:@"取消",nil];
        [alert show];
        sha=@"1";
    }
}

//首次进入页面调用
- (void)viewDidLoad {
    
    
    NSString* enStr2=@"<XML><Id>2846</Id><UserName>15614236896</UserName></XML>";//带传参数
    NSString *path2 =@"/article/getArticleDetail";// 路径
    DeaultEncryptionToDecrypt* defaultEnDecrptManger2=[DeaultEncryptionToDecrypt DefaultEnDecrpt];
    NSString* encryption2=[defaultEnDecrptManger2 encryption:enStr2];
    path2 = [[NSString alloc] initWithFormat:@"%@",path2];
    NSMutableDictionary *param2 = [[NSMutableDictionary alloc] init];
    [param2 setValue:encryption2 forKey:@"data"];
    MKNetworkEngine *engine2 = [[MKNetworkEngine alloc] initWithHostName:HTTP customHeaderFields:nil];
    MKNetworkOperation *op2 = [engine2 operationWithPath:path2
                                                  params:param2 httpMethod:@"POST"];
    [op2 addCompletionHandler:^(MKNetworkOperation *operation2) {
        NSString* result=[operation2 responseString];
        result=[defaultEnDecrptManger2 decrypt:result];
        NSLog(@"123123%@",result);
        NSData* data2=[result dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic2=[NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:nil];
        self.text.text=dic2[@"content"];
        //详情
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err2) {
        NSLog(@"MKNetwork请求错误 : %@", [err2 localizedDescription]);
    }];
    [engine2 enqueueOperation:op2];
   [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard1)];
    [self.view addGestureRecognizer:tap];
    [self initSegmentedControl];

[self.scroll setContentSize:CGSizeMake(UISCREENWEIGHT, 2550)];
    [[_sexLable layer] setCornerRadius:5.0f];
    [[_sexLable layer] setMasksToBounds:YES];
    [[_mySize layer] setCornerRadius:5.0f];
    [[_mySize layer] setMasksToBounds:YES];
    


    
    
    
    
    
    
    
    
    
    
    
    
}
#pragma mark -信息调取
-(void)cheng{
    UserData *userid=[UserData userdata];
    NSString* enStr1=[NSString stringWithFormat:@"<XML><User_Id>%@</User_Id></XML>",userid.dic[@"UserId"]];//带传参数
    NSString *path1 =@"/bbs/getenroll";// 路径
    DeaultEncryptionToDecrypt* defaultEnDecrptManger1=[DeaultEncryptionToDecrypt DefaultEnDecrpt];
    NSString* encryption1=[defaultEnDecrptManger1 encryption:enStr1];
    path1 = [[NSString alloc] initWithFormat:@"%@",path1];
    NSMutableDictionary *param1 = [[NSMutableDictionary alloc] init];
    [param1 setValue:encryption1 forKey:@"data"];
    MKNetworkEngine *engine1 = [[MKNetworkEngine alloc] initWithHostName:HTTP customHeaderFields:nil];
    MKNetworkOperation *op1 = [engine1 operationWithPath:path1
                                                  params:param1 httpMethod:@"POST"];
    [op1 addCompletionHandler:^(MKNetworkOperation *operation) {
        NSString* result1=[operation responseString];
        result1=[defaultEnDecrptManger1 decrypt:result1];
        NSLog(@"%@",result1);
        NSData* data=[result1 dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.name.text=dic[@"joinname"];
        if ([dic[@"joinsex"]isEqualToString:@"1"]) {
            self.sex.selectedSegmentIndex=0;
            
            self.xButton.hidden=NO;
        }else if ([dic[@"joinsex"] isEqualToString:@"2"]){
            self.sex.selectedSegmentIndex=1;
            
            self.xButton.hidden=NO;
        }else{
            self.xButton.hidden=YES;
           
        }
        self.numberNear.text=dic[@"age"];
        self.land.text=dic[@"address"];
        self.numberphone.text=dic[@"telephone"];
        self.introduction.text=dic[@"selfcontext"];
        self.idCard.text=dic[@"id_Card"];
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", [err localizedDescription]);
    }];
    [engine1 enqueueOperation:op1];
    
}
#pragma mark - 登陆页面
-(void)deng{
    UIStoryboard* storyboard=[UIStoryboard storyboardWithName:@"User" bundle:nil];
    AvenueofastarsCollection *destVC1=[storyboard instantiateViewControllerWithIdentifier:@"LandingUserFirst2"];
    [self.navigationController pushViewController:destVC1 animated:YES];

}
#pragma mark - 弹框事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{

    if([sha isEqualToString:@"2"]){
    
    if(buttonIndex==0){//Yes该做的事情
        ShowStart *xing=[ShowStart showStart];
        [xing.dic setObject:@"2" forKey:@"xing"];
        [self deng];
        UserData *UserId=[UserData userdata];
    UserId.loginState=NO;
}else{
    //no做的事情
}
}else{
    if(buttonIndex==0){//Yes该做的事情
        ShowStart *xing=[ShowStart showStart];
        [xing.dic setObject:@"2" forKey:@"xing"];
        [self deng];

    }else{
        //no做的事情
        [self push];
    }
}
    
}

#pragma mark - 返回上一个界面
-(void)push{
//    UIStoryboard* storyboard=[UIStoryboard storyboardWithName:@"Avenueofstars" bundle:nil];
//    AvenueofastarsCollection *destVC1=[storyboard instantiateViewControllerWithIdentifier:@"Avenueofastars"];
////    [self.navigationController pushViewController:destVC1 animated:YES completion:^{} ];
//    [self.navigationController pushViewController:destVC1 animated:YES];
    
    

    
    //返回到上一个视图，比如用户单击导航栏的Back按钮
    [[self navigationController] popViewControllerAnimated:YES];
    //返回到根视图
//    [[self navigationController] popToRootViewControllerAnimated:YES];
//    //返回到任意视图
//    [[self navigationController] popToViewController:destiationViewController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 界面优化
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
#pragma mark - 选择框
- (IBAction)category:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        self.bian.hidden = NO;
        self.text.hidden = NO;
        self.oneView.hidden=YES;
        self.cSPAV.hidden=YES;
    }
    else if([sender selectedSegmentIndex]==1){
        [self cheng];
        self.text.hidden = YES;
        self.bian.hidden = YES;
        self.oneView.hidden=NO;
        self.cSPAV.hidden=YES;
    }else{
        self.text.hidden = YES;
        self.bian.hidden = YES;
        self.oneView.hidden=YES;
        self.cSPAV.hidden=NO;
//        [self shC];
    }
}
#pragma mark - 更换账号按钮
- (IBAction)next:(id)sender {
    self.name.text=@"";
    self.xButton.hidden=YES;
    self.OK.hidden=NO;
    self.numberNear.text=@"";
    self.land.text=@"";
    self.numberphone.text=@"";
    self.introduction.text=@"";
    self.idCard.text=@"";

    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"切换账号?"message:@"是否确认切换账号？" delegate:self cancelButtonTitle:@"确定"otherButtonTitles:@"取消",nil];
    
    [alert show];
    sha=@"2";
}

#pragma mark - 性别
- (IBAction)sex:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
    sexm=@"1";
    }else{
    sexm=@"2";
    }
}
#pragma mark - 消息通知
-(void)messageReminder:(NSString*)message
{
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2, 100, 30)];
    label.text=message;
    label.font=[UIFont systemFontOfSize:12];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    self.view.autoresizesSubviews = YES;
    NSDictionary *attrs = @{NSFontAttributeName : label.font};
    CGSize constraint = CGSizeMake(CGFLOAT_MAX,label.frame.size.height);
    CGRect tmpRect=[label.text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    label.frame=CGRectMake(label.frame.origin.x-tmpRect.size.width/2, label.frame.origin.y, tmpRect.size.width, tmpRect.size.width);
    label.backgroundColor=[UIColor grayColor];
    [self.view.window addSubview:label];
    [UIView animateWithDuration:3 animations:^{
        label.alpha=0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}
#pragma mark - 提交信息
- (IBAction)OK:(id)sender {
    if (self.idCard.text.length!=18) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示"message:@"身份证长度不足十八位" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil,nil];
        [alert show];
        
        
        
    }else{
    
    if (self.numberphone.text.length!=11) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示"message:@"手机号长度不是十八位" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil,nil];
        [alert show];

    }else{
    if ((self.name.text == nil ||[self.name.text isEqualToString:@""])||(self.numberNear.text == nil ||[self.numberNear.text isEqualToString:@""])||(self.land.text == nil ||[self.land.text isEqualToString:@""])) {
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示"message:@"必填信息不能为空" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil,nil];
        [alert show];
   
    }else{
        UserData *userid=[UserData userdata];
        NSString* enStr=[NSString stringWithFormat:@"<XML><UserId>%@</UserId><Name>%@</Name><Sex>%@</Sex><Age>%@</Age><Address>%@</Address><Tel>%@</Tel><Context>%@</Context><Id_Card>%@</Id_Card></XML>",userid.dic[@"UserId"],self.name.text,sexm,self.numberNear.text,self.land.text,self.numberphone.text,self.introduction.text,self.idCard.text];
        NSLog(@"%@",enStr);
        NSString *path =@"/bbs/saveenroll";// 路径
        DeaultEncryptionToDecrypt* defaultEnDecrptManger=[DeaultEncryptionToDecrypt DefaultEnDecrpt];
        NSString* encryption=[defaultEnDecrptManger encryption:enStr];
        NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
        [param setValue:encryption forKey:@"data"];
        MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTP customHeaderFields:nil];
        MKNetworkOperation *op = [engine operationWithPath:path
                                                    params:param httpMethod:@"POST"];
        [op addCompletionHandler:^(MKNetworkOperation *operation) {
            NSDictionary* dic1=[operation responseJSON];
            NSString* result=[operation responseString];
            result=[defaultEnDecrptManger decrypt:result];
            NSLog(@"result:%@",dic1);
            NSLog(@"result:%@",result);
            NSData* data=[result dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([dic[@"result"] isEqualToString: @"SUCCESS"]) {
                 [self messageReminder:@"报名成功"];
                        self.bian.hidden = YES;
                        self.oneView.hidden=YES;
                        self.cSPAV.hidden=NO;
                       self.category.selectedSegmentIndex=2;
                

            }else{
         [self messageReminder:@"报名失败，请检查信息"];
            }
        } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
            NSLog(@"MKNetwork请求错误 : %@", [err localizedDescription]);
        }];
        [engine enqueueOperation:op];

        
    }
    }
   
    }
    
}
#pragma mark - 上传视频
-(void)tanK{
    _MyActionSheet = [[UIActionSheet alloc]
                      initWithTitle:nil
                      delegate:self
                      cancelButtonTitle:@"取消"
                      destructiveButtonTitle:nil
                      otherButtonTitles: @"打开摄像机", @"从手机获取",nil];
    
    [_MyActionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //呼出的菜单按钮点击后的响应
    if (buttonIndex == _MyActionSheet.cancelButtonIndex)
    {
        NSLog(@"取消");
    }
    
    switch (buttonIndex)
    {
        case 0:  //打开摄像机
            shC=@"1";
            [self shexiang];
            break;
            
        case 1:  //打开本地视频资源
            shC=@"2";
            [self shipinziyuan];
            break;
    }
}
#pragma mark - 本地视频
-(void)shipinziyuan{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes =  [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];

    [self presentViewController:imagePicker animated:YES completion:nil];

}
#pragma mark - 点击取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
   [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 调用摄像头
-(void)shexiang{
//调用系统摄像头
[self presentViewController:self.imagePicker animated:YES completion:nil];
}
#pragma mark - 视频调用后保存与上传
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
     [self dismissViewControllerAnimated:YES completion:nil];
        NSURL *url=[info objectForKey:UIImagePickerControllerMediaURL];//视频路径
    NSLog(@"%@",url);
        NSString *urlStr=[url path];
    

    
    if([shC isEqualToString:@"1"]){
       
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
        //保存视频到相簿，注意也可以使用ALAssetsLibrary来保存
        UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);//保存视频到相簿
        }
    }else{
    
        NSFileManager *fm  = [NSFileManager defaultManager];
        // 取文件大小
        NSError *error = nil;
        NSDictionary* dictFile = [fm attributesOfItemAtPath:urlStr error:&error];
        long  nFileSize = [dictFile fileSize];//得到文件大小
        long  onesize=1048576;//1M
        if(nFileSize<onesize*20)
        {
            AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
            AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
            gen.appliesPreferredTrackTransform = YES;
            CMTime time = CMTimeMakeWithSeconds(0.0, 600);
            CMTime actualTime;
            CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
            UIImage *thumb = [[UIImage alloc] initWithCGImage:image];

            NSData *data;
            data = UIImageJPEGRepresentation(thumb, 0.6);
            NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            
            //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
            [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
            [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.jpg"] contents:data attributes:nil];
            //得到选择后沙盒中图片的完整路径
            _FilePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,@"/image.jpg"];

    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        UserData *userid=[UserData userdata];

    [dic setValue:userid.dic[@"UserId"] forKey:@"Uid"];
    [dic setValue:shb forKey:@"Fid"];
    NSString *path =@"/bbs/actionStarPublishForum";// 路径
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]
                               initWithHostName:HTTP
                               customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path
                                                params:dic
                                            httpMethod:@"POST"];

        [op addFile:urlStr forKey:@"File1"];
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"];
    [op addFile:_FilePath forKey:@"File2"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {

        NSString* result=[operation responseString];
        
        NSData* data=[result dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

        NSLog(@"%@",dic);
                   NSNumber *code =(NSNumber*)dic[@"code"];
        if([dic[@"result"] isEqualToString:@"SUCCESS"]){
            [self messageReminder:@"上传成功"];
            //返回到上一个视图，比如用户单击导航栏的Back按钮
            
            [[self navigationController] popViewControllerAnimated:YES];
            [self messageReminder:@"上传成功"];

            //返回到根视图
            //    [[self navigationController] popToRootViewControllerAnimated:YES];
            //    //返回到任意视图
            //    [[self navigationController] popToViewController:destiationViewController animated:YES];
        [HUD hide:YES];
            
        }else if(code.intValue==10038){
            
            [HUD hide:YES];
            [self messageReminder:@"上传失败"];
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请先报名之后，再上传视频" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else{
            
            [HUD hide:YES];
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"网络错误，上传失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }

        
        
        
 
        
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        [HUD hide:YES];
        NSLog(@"MKNetwork请求错误 : %@", [err localizedDescription]);
    }];
    [engine enqueueOperation:op];
        if ([op isReady]) {
            
            AppDelegate *deleagte=[UIApplication sharedApplication].delegate;
            sv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UISCREENWIDTH,UISCREENHEIGHT)];
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, WIDTH, 50, 30)];
            [btn setTitle:@"取消" forState: UIControlStateNormal];
            [btn setBackgroundColor:[UIColor redColor]];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
             [btn addTarget:self action:@selector(removebtn) forControlEvents:UIControlEventTouchUpInside];
            [sv addSubview:btn];
            sv.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
            [deleagte.window addSubview:sv];
//              [deleagte.window bringSubviewToFront:_cSPAV];
            self.progressView=[[ASProgressPopUpView alloc] initWithFrame:CGRectMake(10, UISCREENHEIGHT/2-20, UISCREENWIDTH-20, 20)];
            self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:26];
            self.progressView.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
            self.progressView.popUpViewCornerRadius = 16.0;
            [self.progressView showPopUpViewAnimated:YES];
            [sv addSubview:self.progressView];
            
        }

        [op onUploadProgressChanged:^(double progress) {
            self.progressView.progress = progress;
           

            if(progress==1.0)
            {
                if (_cSPAV) {
                    [sv removeFromSuperview];
                    [view removeFromSuperview];
                     [_cSPAV removeFromSuperview];
                }
            }
        }];
  
    }else
    {
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"本地上传请上传小于20M的视屏" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    }
 
}
#pragma mark - 删除视图
-(void)removebtn
{
    [self messageReminder:@"上传失败,已取消"];
    [self.navigationController popToRootViewControllerAnimated:YES];
    [sv removeFromSuperview];
    [view removeFromSuperview];
    [_cSPAV removeFromSuperview];
}
-(void)oo{
    //添加手势
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    HUD.delegate=self;
    HUD.dimBackground = YES;
    [self.navigationController.view.window addSubview:HUD];
    //加载数据
    [HUD show:YES];
    HUD.labelText = @"正在上传，请稍等";
}
#pragma mark - 摄像头配置
-(UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker=[[UIImagePickerController alloc]init];
        _imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;//设置image picker的来源，这里设置为摄像头
        _imagePicker.cameraDevice=UIImagePickerControllerCameraDeviceRear;//设置使用哪个摄像头，这里设置为后置摄像头
        if (self.isVideo) {
            _imagePicker.mediaTypes=@[(NSString *)kUTTypeMovie];
            _imagePicker.videoQuality=UIImagePickerControllerQualityTypeMedium;
            _imagePicker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModeVideo;//设置摄像头模式（拍照，录制视频）
            
        }else{
          //  _imagePicker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModePhoto;
            _imagePicker.mediaTypes=@[(NSString *)kUTTypeMovie];
            _imagePicker.videoQuality=UIImagePickerControllerQualityTypeMedium;
            _imagePicker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModeVideo;//设置摄像头模式（拍照，录制视频）
             _imagePicker.videoMaximumDuration = 180.0f;//设置最长录制3分钟
        }
        _imagePicker.allowsEditing=YES;//允许编辑
        _imagePicker.delegate=self;//设置代理，检测操作
    }
    return _imagePicker;
}
#pragma mark -////视频保存后的回调

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{

        if (error) {
            
            NSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
        }else{
            //添加手势
            HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
            HUD.delegate=self;
            HUD.dimBackground = YES;
            [self.navigationController.view.window addSubview:HUD];
            //加载数据
            [HUD show:YES];
            HUD.labelText = @"正在上传，请稍等";
            NSLog(@"视频保存成功.");
                if ([shC isEqualToString:@"1"]) {
            NSURL *url=[NSURL fileURLWithPath:videoPath];//视频路径
            NSLog(@"%@",url);
            NSString *urlStr=[url path];
            
            AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
            AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
            gen.appliesPreferredTrackTransform = YES;
            CMTime time = CMTimeMakeWithSeconds(0.0, 600);
            NSError *error = nil;
            CMTime actualTime;
            CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
            UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
            
            NSData *data;
            data = UIImageJPEGRepresentation(thumb, 0.6);
            NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            
            //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
            [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
            [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.jpg"] contents:data attributes:nil];
            //得到选择后沙盒中图片的完整路径
            _FilePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,@"/image.jpg"];
            
            
            
            
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
                    UserData *userid=[UserData userdata];
                    [dic setValue:userid.dic[@"UserId"] forKey:@"Uid"];
            [dic setValue:shb forKey:@"Fid"];
            NSString *path =@"/bbs/actionStarPublishForum";// 路径
            MKNetworkEngine *engine = [[MKNetworkEngine alloc]
                                       initWithHostName:HTTP
                                       customHeaderFields:nil];
            MKNetworkOperation *op = [engine operationWithPath:path
                                                        params:dic
                                                    httpMethod:@"POST"];
            [op addFile:urlStr forKey:@"File1"];
            [op addFile:_FilePath forKey:@"File2"];
            [op addCompletionHandler:^(MKNetworkOperation *operation) {
                NSString* result=[operation responseString];
                
                NSData* data=[result dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSLog(@"%@",dic);
                 NSNumber *code =(NSNumber*)dic[@"code"];
                if([dic[@"result"] isEqualToString:@"SUCCESS"]){
                  
                    //返回到上一个视图，比如用户单击导航栏的Back按钮
                    [[self navigationController] popViewControllerAnimated:YES];
                    //返回到根视图
                    //    [[self navigationController] popToRootViewControllerAnimated:YES];
                    //    //返回到任意视图
                    //    [[self navigationController] popToViewController:destiationViewController animated:YES];
                      [self messageReminder:@"上传成功，后台整理数据就可以观看了"];
                    [HUD hide:YES];
                }else if(code.intValue==10038){
                   
                    [HUD hide:YES];
                     [self messageReminder:@"上传失败"];
                    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请先报名之后，再上传视频" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }else{
               
                    [HUD hide:YES];
                    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"网络错误，上传失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
  
            } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
                [HUD hide:YES];
                NSLog(@"MKNetwork请求错误 : %@", [err localizedDescription]);
            }];
            [engine enqueueOperation:op];
                    if ([op isReady]) {
                        
                        AppDelegate *deleagte=[UIApplication sharedApplication].delegate;
                        sv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UISCREENWIDTH,UISCREENHEIGHT)];
                        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, WIDTH, 50, 30)];
                        [btn setTitle:@"取消" forState: UIControlStateNormal];
                        [btn setBackgroundColor:[UIColor redColor]];
                        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                        [btn addTarget:self action:@selector(removebtn) forControlEvents:UIControlEventTouchUpInside];
                        [sv addSubview:btn];
                        sv.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
                        [deleagte.window addSubview:sv];
                        //              [deleagte.window bringSubviewToFront:_cSPAV];
                        self.progressView=[[ASProgressPopUpView alloc] initWithFrame:CGRectMake(10, UISCREENHEIGHT/2-20, UISCREENWIDTH-20, 20)];
                        self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:26];
                        self.progressView.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
                        self.progressView.popUpViewCornerRadius = 16.0;
                        [self.progressView showPopUpViewAnimated:YES];
                        [sv addSubview:self.progressView];
                        
                    }
                    
                    [op onUploadProgressChanged:^(double progress) {
                        self.progressView.progress = progress;
                        
                        
                        if(progress==1.0)
                        {
                            if (_cSPAV) {
                                [sv removeFromSuperview];
                                [view removeFromSuperview];
                                [_cSPAV removeFromSuperview];
                            }
                        }
                    }];

                }else{
                     [HUD hide:YES];
             ;
                }
        }
}
//星光大道
- (IBAction)selfAVX:(id)sender {
    shb=@"48";
        [self tanK];
 
}
//最美童声
- (IBAction)selfAVT:(id)sender {
    shb=@"49";
        [self tanK];
    
    
}
//模特大赛
- (IBAction)selfMT:(id)sender {
    shb=@"50";
        [self tanK];
    
}
//点击事件执行的方法
#pragma mark -/ 灰屏控制
- (void)hudWasHidden:(MBProgressHUD *)hud {
    [HUD removeFromSuperview];
    HUD = nil;
}
@end
