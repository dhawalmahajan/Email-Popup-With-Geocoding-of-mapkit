//
//  ViewController.h
//  Inscript email Task
//
//  Created by Dhawal Mahajan on 22/03/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MapKit/MapKit.h>
@import MessageUI;

@interface ViewController : UIViewController <MKMapViewDelegate,MFMailComposeViewControllerDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
- (IBAction)sendEmail:(UIButton *)sender;

@end

