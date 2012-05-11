//
//  DXViewController.h
//  AuraBTResearch
//
//  Created by Zhenia on 05/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface DXViewController : UIViewController <CBPeripheralDelegate, CBCentralManagerDelegate>
{
    CBCentralManager *mgr;
}

@property (readwrite, nonatomic) CBCentralManager *mgr;

@end