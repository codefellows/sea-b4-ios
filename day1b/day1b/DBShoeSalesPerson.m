//
//  DBShoeSalesPerson.m
//  day1b
//
//  Created by John Clem on 9/9/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "DBShoeSalesPerson.h"
#import "DBShoe.h"

@implementation DBShoeSalesPerson

- (id)init
{
    self = [super init];
    DBShoe *shoeOne = [DBShoe shoeWithSize:11.];
    
    shoeOne.material = @"leather or metal or something";
    
    NSLog(@"Shoe has material %@ and size %f", shoeOne.material, shoeOne.shoeSize);

    [shoeOne setMaterial:@"plastic"];

    NSLog(@"%@", [shoeOne material]);
    
    if ([shoeOne eyelets].count) {
        NSLog(@"Eyelet One: %@", [[shoeOne eyelets] objectAtIndex:0]);
    }
    
//    shoeOne.objectProperties(0, "leather", 6.5);
//    [shoeOne propertiesWithEyelets:0
//                       andMaterial:@"leather"
//                           andSize:6.5];
    return self;
}

@end
