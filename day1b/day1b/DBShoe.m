//
//  DBShoe.m
//  day1b
//
//  Created by John Clem on 9/9/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "DBShoe.h"

@implementation DBShoe

@synthesize material = _material;

- (id)initWithSize:(CGFloat)size
{
    self = [super init];
    if (self) {
        _shoeSize = size;
        _material = [NSString stringWithFormat:@"leather"];
        _eyelets = [[NSArray alloc] init];
        
    }
    
    return self;
}

- (BOOL)isWornOut
{
    return _wornOut;
}

+ (DBShoe *)shoeWithSize:(CGFloat)size
{
    [[NSUserDefaults standardUserDefaults] floatForKey:@"myShoeSize"];
//    [UIScreen mainScreen]
    
    return [[DBShoe alloc] initWithSize:size];
}

- (void)setMaterial:(NSString *)material
{
    NSLog(@"setting material to %@", material);
    _material = [material copy];
}

- (NSString *)material
{
    return [NSString stringWithFormat:@"Organic %@",  _material];
}

- (NSArray *)eyelets
{
    if (!_eyelets) {
        _eyelets = [NSArray new];
    }
    
    return _eyelets;
}

@end
