//
//  ImageData.m
//  iPainter1.0
//
//  Created by Leo_champion on 13-12-20.
//  Copyright (c) 2013年 Leo_champion. All rights reserved.
//

#import "ImageData.h"

@implementation ImageData
+(UIImage *)getImage
{
    NSString *paths = NSTemporaryDirectory();
    paths = [paths stringByAppendingPathComponent:@"image.png"];
    UIImage *image = [UIImage imageWithContentsOfFile:paths];
    
    return image;
}

+(void)setImage:(UIImage *)image
{
    NSString *paths = NSTemporaryDirectory();
    paths = [paths stringByAppendingPathComponent:@"image.png"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:paths atomically:YES];
}

+(void)deleteImage
{
    NSString *paths = NSTemporaryDirectory();
    paths = [paths stringByAppendingPathComponent:@"image.png"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:paths error:nil];
}
@end
