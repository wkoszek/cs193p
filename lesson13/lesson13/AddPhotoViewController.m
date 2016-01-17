//
//  AddPhotoViewController.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/14/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "AddPhotoViewController.h"
#import "Photo.h"
#import "MapKit/MapKit.h"
@import MobileCoreServices;


@interface AddPhotoViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *subtitleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) NSURL *imageURL;
@property (strong, nonatomic) NSURL *thumbnailURL;
@property (strong, nonatomic, readwrite) Photo *addedPhoto;

@end

@implementation AddPhotoViewController

+ (BOOL)canAddPhoto
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        if ([availableMediaTypes containsObject:(NSString *)kUTTypeImage]) {
            if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted) {
                return YES;
            }
        }
    }
    return NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if (![[self class] canAddPhoto]) {
        [self fatalAlert:@"This device can't add photo"];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    return YES;
}

#define UNWIND_SEGUE_IDENTIFIER @"Do Add Photo"

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:UNWIND_SEGUE_IDENTIFIER]) {
        NSManagedObjectContext *context = self.photographerTakingPhoto.managedObjectContext;
        if (context) {
            Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                                         inManagedObjectContext:context];
            photo.title = self.titleTextField.text;
            photo.subtitle = self.subtitleTextField.text;
            photo.whoTook = self.photographerTakingPhoto;
            photo.latitude = @(self.location.coordinate.latitude);
            photo.longitude = @(self.location.coordinate.longitude);
            photo.imageURL = [self.imageURL absoluteString];
            photo.thumbnailURL = [self.thumbnailURL absoluteString];

            self.addedPhoto = photo;
        }
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    BOOL ret = NO;

    if ([identifier isEqualToString:UNWIND_SEGUE_IDENTIFIER]) {
        if (!self.image) {
            [self alert:@"No photo taken!"];
        } else if (![self.titleTextField.text length]) {
            [self alert:@"Title required"];
        } else {
            ret = YES;
        }
    } else {
        return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
    }

    return ret;
}

- (void)alert:(NSString *)msg
{
    [[[UIAlertView alloc] initWithTitle:@"Add photo"
                               message:msg
                              delegate:nil
                     cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

- (void)fatalAlert:(NSString *)msg
{
    [[[UIAlertView alloc] initWithTitle:@"Add photo"
                                message:msg
                               delegate:self
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self cancel];
}

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
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)done {
}

@end
