//
//  ViewController.m
//  GetMacAddress
//
//  Created by jack ma on 2017/12/14.
//  Copyright © 2017年 jack ma. All rights reserved.
//

#import "ViewController.h"
#import "MacAddressManager.h"
@interface ViewController (){
    UILabel *macLB ;
    UIButton *getMacAddressBT;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    macLB = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    macLB.text =@"Mac地址";
    macLB.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:macLB];
    
    getMacAddressBT = [[UIButton alloc]initWithFrame:CGRectMake(100, 220, 200, 100)];
    [getMacAddressBT setTitle:@"获取Mac地址" forState:(UIControlStateNormal)];
    [getMacAddressBT setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [getMacAddressBT addTarget:self action:@selector(getMacAddress:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:getMacAddressBT];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) getMacAddress:(UIButton *)sender{
    NSString *mac = [MacAddressManager getMacAddressFromMDNS];
    macLB.text = mac;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
