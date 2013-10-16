//
//  SettingsViewController.m
//  Localized To Dos
//
//  Created by John Clem on 10/15/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
{
    NSArray *switches, *languages;
    __weak IBOutlet UISwitch *english, *french, *german, *japanese, *korean, *arabic;
}
@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    switches = [NSArray arrayWithObjects:english, french, german, japanese, korean, arabic, nil];
    languages = [NSArray arrayWithObjects:@"english", @"french", @"german", @"japanese", @"korean", @"arabic", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchLanguage:(id)sender
{
    NSLog(@"Switching To %@", languages[[(UISwitch*)sender tag] ]);
    
    for (UISwitch *langSwitch in switches) {
        if ([sender isEqual:langSwitch]) {
            [langSwitch setUserInteractionEnabled:NO];
        } else {
            [langSwitch setUserInteractionEnabled:YES];
            [langSwitch setOn:NO animated:YES];
        }
    }
}

@end
