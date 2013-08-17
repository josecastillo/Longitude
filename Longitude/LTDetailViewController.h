//
//  LTDetailViewController.h
//  Longitude
//
//  Created by Joey Castillo on 8/17/13.
//  Copyright (c) 2013 Panchromatic, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LTEvent.h"

@interface LTDetailViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) LTEvent *detailItem;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
