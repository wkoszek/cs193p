//
//  AppDelegate.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "AppDelegate.h"
#import "PhotomaniaAppDelegate+MOC.h"
#import "FlickrFetcher.h"
#import "Photo+Flickr.h"

@interface AppDelegate () <NSURLSessionDownloadDelegate>
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

    [self startFlickrFetch];
    return YES;
}

- (void) startFlickrFetch
{
    [self.flickrDownloadSession getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        if (![downloadTasks count]) {
            NSURLSessionDownloadTask *task = [self.flickrDownloadSession downloadTaskWithURL:[FlickrFetcher URLforRecentGeoreferencedPhotos]];
            task.taskDescription = FLICKR_FETCH;
            [task resume];
        } else {
            for (NSURLSessionDownloadTask *task in downloadTasks) {
                [task resume];
            }
        }
    }];
}

- (NSURLSession *)flickrDownloadSession
{
    if (!_flickrDownloadSession) {
        static dispatch_once_t onceToken;

        dispatch_once(&onceToken, ^{
            NSURLSessionConfiguration *config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:FLICKR_FETCH];
            config.allowsCellularAccess = NO;
            _flickrDownloadSession = [NSURLSession sessionWithConfiguration:config
                                                                   delegate:self
                                                              delegateQueue:nil];
        });
    }
    return _flickrDownloadSession;
}

-(void)URLSession:(NSURLSession *)session
     downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)localFile
{
    if ([downloadTask.taskDescription isEqualToString:FLICKR_FETCH]) {
        NSManagedObjectContext *context = self.photoDatabaseContext;
        if (context) {
            NSArray *photos = [self flickrPhotosAtURL:localFile];
            [context performBlock:^{
                [Photo loadPhotosFromFlickrArray:photos
                        intoManagedObjectContext:context];
                [context save:NULL];
            }];
        } else {
            [self flickrDownloadTasksMightBeComplete];
        }
    }
}

-(void)URLSession:(NSURLSession *)session
             downloadTask:(NSURLSessionDownloadTask *)downloadTask
             didResumeAtOffset:(int64_t)fileOffset
             expectedTotalBytes:(int64_t)expectedTotalBytes
{

}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{

}

- (void)flickrDownloadTasksMightBeComplete
{

}

@end
