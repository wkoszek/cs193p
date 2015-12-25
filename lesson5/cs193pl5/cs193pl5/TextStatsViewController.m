//
//  TextStatsViewController.m
//  cs193pl5
//
//  Created by Wojciech Koszek (home) on 12/24/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabels;
@property (weak, nonatomic) IBOutlet UILabel *outlinesCharactersLabel;

@end

@implementation TextStatsViewController

- (void) setTextToAnalyze:(NSAttributedString *)textToAnalyze
{

    _textToAnalyze = textToAnalyze;
    [self updateUI];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void) updateUI {
    NSLog(@"Update UI");

    self.colorfulCharactersLabels.text = [[NSString alloc] initWithFormat:@"%d colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinesCharactersLabel.text = [[NSString alloc] initWithFormat:@"%d outlined characters", [[self charactersWithAttribute:NSStrokeColorAttributeName] length]];
}

- (NSAttributedString *) charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [NSMutableAttributedString new];
    int i = 0;

    while (i < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:i effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            i = range.location + range.length;
        } else {
            i++;
        }
    }
    NSLog(@"LOG: %@", [characters string]);
    return characters;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
