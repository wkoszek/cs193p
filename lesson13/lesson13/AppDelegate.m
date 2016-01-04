//
//  AppDelegate.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "AppDelegate.h"
#import "PhotomaniaAppDelegate+MOC.h"


@interface AppDelegate ()
@property (copy, nonatomic) void (^flickrDownloadBackgroundURLSessionCompletionHandler)();
@property (strong, nonatomic) NSURLSession *flickrDownloadSession;
@property (strong, nonatomic) NSTimer *flickrForegroundTimer;
@property (strong, nonatomic) NSManagedObjectContext *photoDatabaseContext;
@end

#define FLICKR_FETCH @"Flickr Just Uploaded Fetch"

#define FOREGROUND_FLICKR_FETCH_INTERVAL (20*60)

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.photoDatabaseContext = [self createMainQueueManagedObjectContext];

    return YES;
}

@end
