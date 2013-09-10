//
//  DBShoe.h
//  day1b
//
//  Created by John Clem on 9/9/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBShoe : NSObject

@property (readonly, nonatomic) CGFloat shoeSize;
@property (nonatomic, copy) NSString *material;
@property (nonatomic, getter = isWornOut) BOOL wornOut;
@property (nonatomic) NSArray *eyelets;

- (id)initWithSize:(CGFloat)size;

+ (DBShoe *)shoeWithSize:(CGFloat)size;

@end







