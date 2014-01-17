//
//  ViewController.m
//  GPSManagerApp
//
//  Created by SDT-1 on 2014. 1. 17..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "TMapView.h"

#define APP_KEY @"7b7b1456-6496-3c3e-ae92-3cf87fd15065"
#define TOOLBAR_HEIGHT 70

@interface ViewController ()<TMapGpsManagerDelegate, TMapViewDelegate>

@property (strong, nonatomic) TMapGpsManager *gpsManager;
@property (strong, nonatomic) TMapView *mapView;

@end

@implementation ViewController

#pragma mark GPS Manager's Delegate
-(void)locationChanged:(TMapPoint *)newTmp{
    NSLog(@"Location Changed : %@", newTmp);
    [self.mapView setCenterPoint:newTmp];
}

-(void)headingChanged:(double)heading{
    
}

- (IBAction)switchGPS:(id)sender {
    UISwitch *_switch = (UISwitch *)sender;
    
    if (YES == _switch.on) {
        [self.gpsManager openGps];
    }else{
        [self.gpsManager closeGps];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 툴바의 크기를 고려한 mapView
    CGRect rect = CGRectMake(0, TOOLBAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - TOOLBAR_HEIGHT);
    self.mapView = [[TMapView alloc] initWithFrame:rect];
    self.mapView.zoomLevel = 12.0;
    [self.view addSubview:self.mapView];
    
    self.gpsManager = [[TMapGpsManager alloc] init];
    [self.gpsManager setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
