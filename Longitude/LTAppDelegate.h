//
//  LTAppDelegate.h
//  Longitude
//
//  Created by Joey Castillo on 8/17/13.
//  Copyright (c) 2013 Panchromatic, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
