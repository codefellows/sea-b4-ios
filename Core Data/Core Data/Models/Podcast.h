//
//  Podcast.h
//  Core Data
//
//  Created by John Clem on 9/24/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Podcast : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * feedURL;
@property (nonatomic, retain) NSData * posterImage;
@property (nonatomic, retain) NSOrderedSet *episodes;
@end

@interface Podcast (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inEpisodesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEpisodesAtIndex:(NSUInteger)idx;
- (void)insertEpisodes:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEpisodesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEpisodesAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceEpisodesAtIndexes:(NSIndexSet *)indexes withEpisodes:(NSArray *)values;
- (void)addEpisodesObject:(NSManagedObject *)value;
- (void)removeEpisodesObject:(NSManagedObject *)value;
- (void)addEpisodes:(NSOrderedSet *)values;
- (void)removeEpisodes:(NSOrderedSet *)values;
@end
