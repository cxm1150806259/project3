//
//  CXMViewController.h
//  iPainter1.0
//
//  Created by Leo_champion on 13-12-20.
//  Copyright (c) 2013年 Leo_champion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;
- (IBAction)changeColor:(id)sender;
- (IBAction)changeSize:(id)sender;
- (IBAction)clearImage:(id)sender;
- (IBAction)saveCurrentImage:(id)sender;

- (void)showSaveStatus:(BOOL)isSuccess;
- (NSString *)getFilePath:(NSString *)imageName;
- (void)saveToPath:(NSString *)imageName;
- (void)setLsatImage:(UIImage *)image;

@end
