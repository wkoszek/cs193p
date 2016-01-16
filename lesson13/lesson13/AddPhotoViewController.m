//
//  AddPhotoViewController.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/14/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "AddPhotoViewController.h"

@interface AddPhotoViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *subtitleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@end

@implementation AddPhotoViewController

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

- (UIImage *)image
{
    return self.imageView.image;
}

- (IBAction)takePhoto {
}
- (IBAction)cancel {
}
- (IBAction)done {
}

@end
