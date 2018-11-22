//
//  UIViewController+MutipleImageChoice.m
//  testPickerImage
//
//  Created by shiyong_li on 16/6/11.
//  Copyright © 2016年 shiyong_li. All rights reserved.
//

#import "UIViewController+MutipleImageChoice.h"
#import "ZYQAssetPickerController.h"
#import <Foundation/NSFileManager.h>
#import <objc/runtime.h>
#import "ReactiveCocoa.h"

@interface UIViewController (_MutipleImageChoice)<ZYQAssetPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, copy) void (^finishBlock)(NSArray *array);
@end
@implementation UIViewController (MutipleImageChoice)
/**
 *
 * 参考UIWebView+AFNetworking
 *
 */
- (void (^)(NSArray *))finishBlock
{
    return objc_getAssociatedObject(self, @selector(finishBlock));
}

- (void)setFinishBlock:(void (^)(NSArray *))finishBlock
{
    objc_setAssociatedObject(self, @selector(finishBlock), finishBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addImageWithFinishBlock:(void (^)(NSArray *))finishBlock
{
    [self addImageWithMutipleChoise:NO andFinishBlock:finishBlock];
}
- (void)addImageWithMutipleChoise:(BOOL)mutipleChoice andFinishBlock:(void (^)(NSArray *))finishBlock
{
    [self addImageWithMaxSelection:8 andMutipleChoise:mutipleChoice andFinishBlock:finishBlock];
}

- (void)addImageWithMaxSelection:(NSInteger)maxSelection andFinishBlock:(void (^)(NSArray *))finishBlock
{
    [self addImageWithMaxSelection:maxSelection andMutipleChoise:NO andFinishBlock:finishBlock];
}
- (void)addImageWithMaxSelection:(NSInteger)maxSelection andMutipleChoise:(BOOL)mutipleChoice sourceType:(UIImagePickerControllerSourceType)sourceType andFinishBlock:(void (^)(NSArray *))finishBlock
{
    self.finishBlock = finishBlock;
    if (sourceType == UIImagePickerControllerSourceTypeCamera) {//照相机
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIImagePickerController *imageController = [[UIImagePickerController alloc]init];
            imageController.delegate = self;
            imageController.allowsEditing = YES;
            imageController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imageController animated:YES completion:nil];
            
            
        }else{
//            UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"相机" message:@"相机不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//            [alertView show];
            UIAlertController *noAlertController = [UIAlertController alertControllerWithTitle:@"相机" message:@"相机不可用" preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *act0 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [noAlertController addAction:act0];
            [self presentViewController:noAlertController animated:YES completion:nil];
            return;
        }
    }else{//相册
        ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
        if (maxSelection>0) {
            picker.maximumNumberOfSelection = maxSelection;
        }
        picker.assetsFilter = ZYQAssetsFilterAllPhotos;
        picker.showEmptyGroups=NO;
        picker.delegate=self;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}
- (void)addImageWithMaxSelection:(NSInteger)maxSelection andMutipleChoise:(BOOL)mutipleChoice andFinishBlock:(void (^)(NSArray *))finishBlock
{
//    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"选择照片来源" message:nil delegate:nil cancelButtonTitle:@"照相机" otherButtonTitles:@"从相册选择", nil];
//    __weak typeof(self) weakSelf = self;
//    [[alertView rac_buttonClickedSignal] subscribeNext:^(id x) {
//        if ([x integerValue] == 0) {
//            [weakSelf addImageWithMaxSelection:maxSelection andMutipleChoise:mutipleChoice sourceType:UIImagePickerControllerSourceTypeCamera andFinishBlock:finishBlock];
//        }else{
//            [weakSelf addImageWithMaxSelection:maxSelection andMutipleChoise:mutipleChoice sourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum andFinishBlock:finishBlock];
//        }
//    }];
//    [alertView show];
    
    UIAlertController *photoAlertController = [UIAlertController alertControllerWithTitle:@"选择照片来源" message:nil preferredStyle:UIAlertControllerStyleAlert];

    __weak typeof(self) weakSelf = self;
    UIAlertAction *act0 = [UIAlertAction actionWithTitle:@"照相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf addImageWithMaxSelection:maxSelection andMutipleChoise:mutipleChoice sourceType:UIImagePickerControllerSourceTypeCamera andFinishBlock:finishBlock];
    }];
    [photoAlertController addAction:act0];

    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf addImageWithMaxSelection:maxSelection andMutipleChoise:mutipleChoice sourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum andFinishBlock:finishBlock];
    }];
    [photoAlertController addAction:act1];

    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [photoAlertController addAction:act2];

    [self presentViewController:photoAlertController animated:YES completion:nil];
}

#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    NSMutableArray *fileNames = [NSMutableArray array];
    for (int i=0; i<assets.count; i++) {
        //        ALAsset *asset=assets[i];
        ZYQAsset *asset=assets[i];
//        UIImage *image = [UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
//        NSString *filePath = [self getFilePathToSaveUnUpdatedImage];
        //        [UIImageJPEGRepresentation(image, 0.7) writeToFile:filePath atomically:YES];
        //        [fileNames addObject:filePath];
        [asset setGetFullScreenImage:^(UIImage *result) {
            [fileNames addObject:result];
            if (fileNames.count == assets.count) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (self.finishBlock) {
                        self.finishBlock(fileNames);
                    }
                });
            }
        }];
    }
}
- (NSString *)getFilePathToSaveUnUpdatedImage {
    NSString *filePath = [[self getImagesFilePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Image_%@.jpg", [NSString stringWithFormat:@"%.0f",[[NSDate new] timeIntervalSince1970] * 1000]]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    return filePath;
}

- (NSString *)getImagesFilePath
{
    NSString *path = [NSString stringWithFormat:@"%@/images",NSTemporaryDirectory()];
    BOOL dictionary;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&dictionary]) {
        //如果该目录不存在 则创建该目录
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog( @" info is   %@",info);
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    NSString *filePath = [self getFilePathToSaveUnUpdatedImage];
    [UIImageJPEGRepresentation(image, 0.7) writeToFile:filePath atomically:YES];
    if (self.finishBlock) {
        
//        self.finishBlock(@[filePath]);
        self.finishBlock(@[image]);
        
//        [self addImageWithMaxSelection:1 andMutipleChoise:NO sourceType:UIImagePickerControllerSourceTypeCamera andFinishBlock:self.finishBlock];
        
    }
}

@end
