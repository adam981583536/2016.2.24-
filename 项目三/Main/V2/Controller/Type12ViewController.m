//
//  Type12ViewController.m
//  项目三
//
//  Created by huiwen on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "Type12ViewController.h"
#import <PassKit/PassKit.h>
#import <passkit/PKPaymentAuthorizationViewController.h>
#import <AddressBook/AddressBook.h>

@interface Type12ViewController ()

@end

@implementation Type12ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"进到12了");
    //self.navigationController.navigationBar.hidden  = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BreadTrip/poi_bg_placeholder@2x.png"]];
    // self.view.backgroundColor = [UIColor blackColor];
    [self _creatBack];
    
}

- (void)_creatBack{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
    [button setImage:[UIImage imageNamed:@"icon_nav_back_button.png"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    
    //BreadTrip/
    UIButton *payButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
    [payButton setTitle:@"付不付钱" forState:UIControlStateNormal];
    
    [payButton addTarget:self action:@selector(PayPress) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *scaItem = [[UIBarButtonItem alloc] initWithCustomView:payButton];
    
    
    self.navigationItem.rightBarButtonItem = scaItem;
    [self.view addSubview:button];
    
    
}

- (void)PayPress{
    NSLog(@"付钱");
    if (![PKPaymentAuthorizationViewController class]) {
        //PKPaymentAuthorizationViewController需iOS8.0以上支持
        NSLog(@"操作系统不支持ApplePay，请升级至9.0以上版本，且iPhone6以上设备才支持");
        return;
    }
    //检查当前设备是否可以支付
    if (![PKPaymentAuthorizationViewController canMakePayments]) {
        //支付需iOS9.0以上支持
        NSLog(@"设备不支持ApplePay，请升级至9.0以上版本，且iPhone6以上设备才支持");
        return;
    }
    //检查用户是否可进行某种卡的支付，是否支持Amex、MasterCard、Visa与银联四种卡，根据自己项目的需要进行检测
    NSArray *supportedNetworks = @[PKPaymentNetworkAmex, PKPaymentNetworkMasterCard,PKPaymentNetworkVisa,PKPaymentNetworkChinaUnionPay];
    if (![PKPaymentAuthorizationViewController canMakePaymentsUsingNetworks:supportedNetworks]) {
        NSLog(@"没有绑定支付卡");
        return;
    }
    PKPaymentRequest *payRequest = [[PKPaymentRequest alloc]init];
    payRequest.countryCode = @"CN";     //国家代码
    payRequest.currencyCode = @"CNY";       //RMB的币种代码
    payRequest.merchantIdentifier = @"merchant.ApplePayDemoYasin";  //申请的merchantID
    payRequest.supportedNetworks = supportedNetworks;   //用户可进行支付的银行卡
    payRequest.merchantCapabilities = PKMerchantCapability3DS|PKMerchantCapabilityEMV;      //设置支持的交易处理协议，3DS必须支持，EMV为可选，目前国内的话还是使用两者吧
    
    payRequest.requiredBillingAddressFields = PKAddressFieldEmail;
    //如果需要邮寄账单可以选择进行设置，默认PKAddressFieldNone(不邮寄账单)
    //楼主感觉账单邮寄地址可以事先让用户选择是否需要，否则会增加客户的输入麻烦度，体验不好，
    payRequest.requiredShippingAddressFields = PKAddressFieldPostalAddress|PKAddressFieldPhone|PKAddressFieldName;
    //送货地址信息，这里设置需要地址和联系方式和姓名，如果需要进行设置，默认PKAddressFieldNone(没有送货地址)

    
}
- (void)buttonPress{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)setType12Id:(NSNumber *)type12Id{
    
    if (_type12Id != type12Id) {
        _type12Id = type12Id;
        // NSLog(@"%@",type12Id);
        
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
