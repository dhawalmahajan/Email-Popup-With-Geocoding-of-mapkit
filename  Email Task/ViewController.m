//
//  ViewController.m
//  Inscript email Task
//
//  Created by Dhawal Mahajan on 22/03/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

#import "ViewController.h"
@interface ViewController () {
    NSString *cityName;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager setDelegate:self];
    [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    
#pragma mark - Geocoding work
    
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    cityName = [[NSString alloc]init];
    [geocoder reverseGeocodeLocation:_locationManager.location completionHandler:^(NSArray<CLPlacemark *> *  placemarks, NSError *  error) {
        
        cityName = [NSString stringWithFormat:@"%@", [placemarks objectAtIndex:0].locality]; 
    }];
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"Email sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Email sendinf failed");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Email saved");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"Email cancelled");
            break;
        default:
            break;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Email from app

- (IBAction)sendEmail:(UIButton *)sender {
    if ([MFMailComposeViewController canSendMail]) {
        NSString *mainBody = @"I have done task and my location is ";
        MFMailComposeViewController *mailController = [MFMailComposeViewController new];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Inscripts Task"];
        [mailController setToRecipients:@[@"xxxx@inscript.in"]];
        [mailController setMessageBody:[mainBody stringByAppendingString: [NSString stringWithFormat:@"%@",cityName]] isHTML:NO];
        mailController.modalPresentationStyle = UIModalPresentationFormSheet;
        [self presentViewController:mailController animated:YES completion:nil];
        
        
        
    } else {
//        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Mail Sending Alert" message:@"mail Can not be sent" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
//
//        [alertView addAction:alertAction];
//        [self presentViewController:alertView animated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
   
                                                   
}



@end
