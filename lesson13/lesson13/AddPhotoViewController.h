//
//  AddPhotoViewController.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/14/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photographer.h"
#import "Photo.h"

@interface AddPhotoViewController : UIViewController

// in
@property (nonatomic, strong) Photographer *photographerTakingPhoto;

// out
@property (nonatomic, readonly) Photo *addedPhoto;

@end
