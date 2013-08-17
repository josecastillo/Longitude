//
//  LTDetailViewController.h
//  Longitude
//
//  Created by Joey Castillo on 8/17/13.
//  Copyright (c) 2013 Panchromatic, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
