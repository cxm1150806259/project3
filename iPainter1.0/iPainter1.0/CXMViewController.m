//
//  CXMViewController.m
//  iPainter1.0
//
//  Created by Leo_champion on 13-12-20.
//  Copyright (c) 2013年 Leo_champion. All rights reserved.
//

#import "CXMViewController.h"
#import "CXMQuartzFunView.h"
#import "Constants.h"
#import "ImageData.h"
@interface CXMViewController ()

@end

@implementation CXMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(id)sender {
    UISegmentedControl *control = sender;
    NSInteger index = [control selectedSegmentIndex];
    CXMQuartzFunView *paintView = (CXMQuartzFunView *)self.view;
    
    switch (index) {
        case kRedColor:
            paintView.currentColor = [UIColor redColor];
            break;
        case kBlackColor:
            paintView.currentColor = [UIColor blackColor];
            break;
        case kYellowColor:
            paintView.currentColor = [UIColor yellowColor];
            break;
        case kBlueColor:
            paintView.currentColor = [UIColor blueColor];
            break;
        default:
            break;
    }
    
}

- (IBAction)changeSize:(id)sender {
    UISegmentedControl *control = sender;
    NSInteger index = [control selectedSegmentIndex];
    CXMQuartzFunView *paintView = (CXMQuartzFunView *)self.view;
    paintView.currentSize = (index + 1) * 2;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    BOOL isInputImageNameView = [[alertView message] isEqualToString:@"请输入图片名"];
    if (isInputImageNameView)
    {
        NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
        if([buttonTitle isEqualToString:@"OK"])
        {
            UITextField *inputContent = [alertView textFieldAtIndex:0];
            NSString *imageName = [NSString stringWithFormat:@"%@",[inputContent text]];
            [self saveToPath:imageName];
        }
    }
}
- (IBAction)clearImage:(id)sender {
    [ImageData deleteImage];
}

- (IBAction)saveCurrentImage:(id)sender {
    UIAlertView *inputImageNameView = [[UIAlertView alloc]initWithTitle:@"Message" message:@"请输入图片名" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    [inputImageNameView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [inputImageNameView show];
}
-(void)showSaveStatus:(BOOL)isSuccess
{
    UIAlertView *alertView = [[UIAlertView alloc]init];
    if (isSuccess)
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"Message" message:@"涂鸦保存成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }else
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"Message" message:@"涂鸦保存失败" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    [alertView show];
}
-(NSString *)getFilePath:(NSString *)imageName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    imageName = [imageName stringByAppendingString:@".png"];
    documentsPath = [documentsPath stringByAppendingPathComponent:imageName];
    
    return documentsPath;
}
-(void)saveToPath:(NSString *)imageName
{
    UIImage *image = [ImageData getImage];
    
    //save image to photo
    /*UIImageWriteToSavedPhotosAlbum([imageview image], nil, nil, nil);
     [self showAlert:YES];*/
    
    //save image to document directory
    NSString *filePath = [self getFilePath:imageName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //if file already exit, tip change name, else save.
    if (![fileManager fileExistsAtPath:filePath])
    {
        NSData *imageData = UIImagePNGRepresentation(image);
        BOOL isSaveSuccess = [imageData writeToFile:filePath atomically:YES];
        [self showSaveStatus:isSaveSuccess];
        filePath = nil;
        imageData = nil;
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc]init];
        alertView = [[UIAlertView alloc] initWithTitle:@"Message" message:@"文件已存在请重命名" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }

}
-(void)setLsatImage:(UIImage *)image
{
     [ImageData setImage:image];
}

@end
