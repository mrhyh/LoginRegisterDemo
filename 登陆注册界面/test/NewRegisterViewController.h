//
//  ViSecondRegistViewController.h
//  找酒吧
//
//  Created by BWsoft on 14/10/23.
//  Copyright (c) 2014年 BWsoft. All rights reserved.
//

#import "VIBaseViewController.h"

@interface NewRegisterViewController : VIBaseViewController

- (IBAction)back:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *verfiyTextField;
- (IBAction)resendeCodeButtonMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (retain, nonatomic) NSString *phoneString;
@property (weak, nonatomic) IBOutlet UIButton *codeRealButton;

@property (weak, nonatomic) IBOutlet UILabel *codeButton;

@property (weak, nonatomic) IBOutlet UILabel *protocolAction;

@end
