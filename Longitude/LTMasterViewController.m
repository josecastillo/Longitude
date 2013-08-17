//
//  LTMasterViewController.m
//  Longitude
//
//  Created by Joey Castillo on 8/17/13.
//  Copyright (c) 2013 Panchromatic, LLC. All rights reserved.
//

#import "LTMasterViewController.h"

#import "LTDetailViewController.h"

@interface LTMasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation LTMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Location History", @"Location History");
    }
    return self;
}
							
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *exportItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Export", @"Export")
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(exportData:)];
    self.navigationItem.leftBarButtonItem = exportItem;
    UIBarButtonItem *actionItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                target:self
                                                                                action:@selector(presentActionSheet:)];
    self.navigationItem.rightBarButtonItem = actionItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.detailViewController) {
        self.detailViewController = [[LTDetailViewController alloc] initWithNibName:@"LTDetailViewController" bundle:nil];
    }
    LTEvent *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    self.detailViewController.detailItem = object;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type {
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    LTEvent *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = object.title;
    cell.detailTextLabel.text = object.subtitle;
}

- (void)presentActionSheet:(id)sender {
    [[[UIActionSheet alloc] initWithTitle:@"Set location accuracy"
                                 delegate:(id<UIActionSheetDelegate>)[[UIApplication sharedApplication] delegate]
                        cancelButtonTitle:@"Cancel"
                   destructiveButtonTitle:nil
                        otherButtonTitles:@"Best Possible", @"Nearest Ten Meters", @"Nearest Hundred Meters", @"Nearest Kilometer", @"Nearest Three Kilometers", nil] showFromBarButtonItem:sender animated:YES];
}

- (void)exportData:(id)sender {
    // Yeah yeah, I know, this is supposed to be for network activity only.
    // Not sumbitting this to the app store, just need a quick indicator and this is quick.
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        id <NSFetchedResultsSectionInfo> section = [[self.fetchedResultsController sections] lastObject];
        NSMutableArray *outputData = [NSMutableArray arrayWithCapacity:[section.objects count]];
        for (LTEvent *event in section.objects) {
            int timestamp = [event.timestamp timeIntervalSinceReferenceDate] * 1000;
            // Don't ask me why but this is Google's format for Latitude data export.
            // Timestamp is a string, accuracy is an integer and and lat/lon are integers multiplied by 1x10^7
            [outputData addObject:@{
             @"timestampMs": [NSString stringWithFormat:@"%d", timestamp],
             @"latitudeE7": @((int)(event.latitudeValue * 1e7)),
             @"longitudeE7": @((int)(event.longitudeValue * 1e7)),
             @"accuracy": @((int)round(event.accuracyValue)),
             }];
        }
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:@{@"locations" : outputData} options:NSJSONWritingPrettyPrinted error:&error];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
            
            NSString *tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"LocationHistory.json"];
            NSURL *tempFileUrl = [NSURL fileURLWithPath:tempFilePath];
            
            if (jsonData && [jsonData writeToURL:tempFileUrl atomically:YES]) {
                if(!documentInteractionController)
                    documentInteractionController = [[UIDocumentInteractionController alloc] init];
                documentInteractionController.URL = tempFileUrl;
                [documentInteractionController presentOpenInMenuFromBarButtonItem:sender animated:YES];
            } else {
                [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"Error")
                                            message:error ? [error localizedDescription] : NSLocalizedString(@"Unknown Error", @"Unknown Error")
                                           delegate:nil
                                  cancelButtonTitle:NSLocalizedString(@"OK", @"OK")
                                  otherButtonTitles:nil] show];
            }
        });
    });
}

@end
