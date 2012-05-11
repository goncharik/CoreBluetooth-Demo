//
//  DXViewController.m
//  AuraBTResearch
//
//  Created by Zhenia on 05/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DXViewController.h"

@interface DXViewController ()

@end

@implementation DXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    mgr = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral
                 error:(NSError *)error {

}


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {


    NSLog([NSString stringWithFormat:@"%@",[advertisementData description]]);
}

-(void)centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals{
    NSLog(@"This is it!");

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BT Research"
                                                    message:@"Peripherals conneced"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    NSString *messtoshow;

    switch (central.state) {
        case CBCentralManagerStateUnknown:
        {
            messtoshow=[NSString stringWithFormat:@"State unknown, update imminent."];
            break;
        }
        case CBCentralManagerStateResetting:
        {
            messtoshow=[NSString stringWithFormat:@"The connection with the system service was momentarily lost, update imminent."];
            break;
        }
        case CBCentralManagerStateUnsupported:
        {
            messtoshow=[NSString stringWithFormat:@"The platform doesn't support Bluetooth Low Energy"];
            break;
        }
        case CBCentralManagerStateUnauthorized:
        {
            messtoshow=[NSString stringWithFormat:@"The app is not authorized to use Bluetooth Low Energy"];
            break;
        }
        case CBCentralManagerStatePoweredOff:
        {
            messtoshow=[NSString stringWithFormat:@"Bluetooth is currently powered off."];
            break;
        }
        case CBCentralManagerStatePoweredOn:
        {
            messtoshow=[NSString stringWithFormat:@"Bluetooth is currently powered on and available to use."];
            //[mgr scanForPeripheralsWithServices:nil options:nil];
            [mgr scanForPeripheralsWithServices:[NSArray arrayWithObject:[CBUUID UUIDWithString:@"180A"]] options:nil];
            //[mgr retrieveConnectedPeripherals];

            break;
        }

    }

    NSLog(messtoshow);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BT Research"
                                                    message:messtoshow
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end