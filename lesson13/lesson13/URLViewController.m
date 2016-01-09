//
//  URLViewController.m
//  lesson13
//
//  Created by Wojciech Koszek on 1/8/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "URLViewController.h"

@interface URLViewController ()

@property (weak, nonatomic) IBOutlet UITextView *urlTextView;

@end
@implementation URLViewController

- (void) setUrl:(NSURL *)url
{
    _url = url;
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}

- (void)updateUI
{

    self.urlTextView.text = [self.url absoluteString];
}

@end
