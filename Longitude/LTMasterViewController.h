//
//  LTMasterViewController.h
//  Longitude
//
//  Created by Joey Castillo on 8/17/13.
//  Copyright (c) 2013 Panchromatic, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTDetailViewController;

#import <CoreData/CoreData.h>

@interface LTMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) LTDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
