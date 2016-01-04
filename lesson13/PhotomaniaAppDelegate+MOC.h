//
//  PhotomaniaAppDelegate+MOC.h
//  Photomania
//
//  This code comes from the Xcode template for Master-Detail application.
//

#import "AppDelegate.h"

@interface AppDelegate (MOC)

- (NSManagedObjectContext *)createMainQueueManagedObjectContext;

@end
