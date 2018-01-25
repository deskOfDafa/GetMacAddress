//
//  ViewController.m
//  GetMacAddress
//
//  Created by jack ma on 2017/12/14.
//  Copyright © 2017年 jack ma. All rights reserved.
//

#import "ViewController.h"
#import "MacAddressManager.h"
#import "Reachability.h"


@interface ViewController (){
    UILabel *macLB ;
    UIButton *getMacAddressBT;
}
@property (nonatomic, strong) Reachability *wifiReachability;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    macLB = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    macLB.text =@"Mac地址";
    macLB.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:macLB];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    _wifiReachability = [Reachability reachabilityForLocalWiFi];
    [_wifiReachability startNotifier];
    [self reachabilityChanged:nil];
    
    getMacAddressBT = [[UIButton alloc]initWithFrame:CGRectMake(100, 220, 200, 100)];
    [getMacAddressBT setTitle:@"获取Mac地址" forState:(UIControlStateNormal)];
    [getMacAddressBT setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [getMacAddressBT addTarget:self action:@selector(getMacAddress:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:getMacAddressBT];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) getMacAddress:(UIButton *)sender{
    NSString *mac = [MacAddressManager getMacAddressFromMDNS];
    macLB.text = mac;
}

- (void)dealloc {
    [_wifiReachability stopNotifier];
}

- (void) reachabilityChanged:(NSNotification *)note {
    if(self.wifiReachability.currentReachabilityStatus == NotReachable) {
        [getMacAddressBT setTitle:@"No Wi-Fi Connection" forState:UIControlStateNormal];
        [getMacAddressBT setEnabled:NO];
    }//end if
    else {
        [getMacAddressBT setTitle:@"Get MAC Address" forState:UIControlStateNormal];
        [getMacAddressBT setEnabled:YES];
    }//end else
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
