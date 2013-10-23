//
//  MDGameKitHelper.h
//  stepster
//
//  Created by John Clem on 10/21/13.
//  Copyright (c) 2013 Mind DIaper. All rights reserved.
//

#import <GameKit/GameKit.h>

extern NSString *const PresentAuthenticationViewController;

@interface GameKitHelper : NSObject

@property (nonatomic, readonly)
UIViewController *authenticationViewController;
@property (nonatomic, readonly) NSError *lastError;

+ (instancetype)sharedGameKitHelper;

- (void)authenticateLocalPlayer;

- (void)reportAchievements:(NSArray *)achievements;

- (void)showGKGameCenterViewController:(UIViewController *)viewController;

- (void)reportScore:(int64_t)score forLeaderboardID:(NSString*)leaderboardID;

@end
