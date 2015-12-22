//
//  ViewController.m
//  cs193pl5
//
//  Created by Wojciech Koszek (home) on 12/21/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *changeBody;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeBody:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSLog(@"sender: %p", sender);

    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:button.backgroundColor
                                  range:self.body.selectedRange];
}

@end
