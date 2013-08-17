//
//  LTDetailViewController.m
//  Longitude
//
//  Created by Joey Castillo on 8/17/13.
//  Copyright (c) 2013 Panchromatic, LLC. All rights reserved.
//

#import "LTDetailViewController.h"

@interface LTDetailViewController ()
- (void)configureView;
@end

@implementation LTDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    if (self.detailItem) {
        [self.mapView addAnnotation:self.detailItem];
        [self.mapView selectAnnotation:self.detailItem animated:YES];
    }
    
    [self.mapView setRegion:MKCoordinateRegionMake(self.detailItem.coordinate, MKCoordinateSpanMake(.01, .01)) animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Location Detail", @"Location Detail");
    }
    return self;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
    
    if (pin)
        pin.annotation = annotation;
    else
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:@"Pin"];
    pin.canShowCallout = YES;
    
    return pin;
}
							
@end
