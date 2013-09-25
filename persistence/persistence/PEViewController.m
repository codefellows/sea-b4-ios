//
//  PEViewController.m
//  persistence
//
//  Created by John Bender on 9/25/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "PEViewController.h"
#import "PEObject.h"

@interface PEViewController ()
-(IBAction) pressedButton;
@end

@implementation PEViewController

-(IBAction) pressedButton
{
    // plist
    NSURL *documentsPath = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSDictionary *dict = @{@"string": @"another value",
                           @"number": @5};
    NSURL *myDictFile = [documentsPath URLByAppendingPathComponent:@"myDict.plist"];
    [dict writeToURL:myDictFile atomically:YES];
    NSLog( @"wrote file %@", myDictFile );

    NSDictionary *reread = [NSDictionary dictionaryWithContentsOfURL:myDictFile];
    NSLog( @"%@", reread );

    // user defaults
    NSDictionary *initial = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyDictKey"];
    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"MyDictKey"];
    NSDictionary *final = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyDictKey"];
    NSLog( @"%@ %@", initial, final );

    // keyed archiver
    PEObject *obj = [PEObject new];
    obj.username = @"Me";
    obj.imagePath = @"http://google.com";
    obj.image = [UIImage imageNamed:@"Default"];

    NSString *homePath = NSHomeDirectory();
    NSString *docPath = [homePath stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"myObj.bin"];
    [NSKeyedArchiver archiveRootObject:obj toFile:filePath];
    NSLog( @"saved to %@", filePath );

    PEObject *newObj = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog( @"%@\n%@", obj, newObj );
}

@end
