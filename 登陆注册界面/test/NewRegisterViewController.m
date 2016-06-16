//
//  ViSecondRegistViewController.m
//  找酒吧
//
//  Created by BWsoft on 14/10/23.
//  Copyright (c) 2014年 BWsoft. All rights reserved.
//

#import "NewRegisterViewController.h"
#import "Header.h"

@interface NewRegisterViewController () <UITextFieldDelegate>{
    NSString  *_registerCodeString;
    NSString  *_strTime;
    
    BOOL isFirst;
}
@end

static NSTimer   *timer;
static NSInteger lodingTime;

@implementation NewRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [_verfiyTextField becomeFirstResponder];
        _verfiyTextField.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _protocolAction.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [_protocolAction addGestureRecognizer:tapGesture];
    
    [self.titleView removeFromSuperview];
    
    // Do any additional setup after loading the view from its nib.
    isFirst = YES;
    [self initializeUserInterface];
//     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sencond:) name:@"second" object:nil];
    [self starTimer];
    
}

- (void)click:(UIGestureRecognizer *)gesture{
    NSLog(@"(void)click:(UIGestureRecognizer *)");
}

- (void)getRegisterCodeHttpRequest {

}

- (void) initializeUserInterface{
}

#pragma mark -- <UITextFieldDelegate>
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location > 5) {
        return NO;
    }
    else {
        return YES;
    }
}


//下一步
- (void)theRightButtonPressed {
    [_verfiyTextField resignFirstResponder];
    [self VerifyRegisterCodeHttpRequest];
}

#pragma mark -- <验证验证码>
- (void)VerifyRegisterCodeHttpRequest {

}

- (void)processTimer:(NSTimer *)timer {
    
}

- (void)sencond:(NSNotification *)sender {
    
    [self starTimer];
}

- (void)starTimer
{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 //定时执行
                                                 target:self
                                               selector:@selector(processTimer:)
                                               userInfo:nil repeats:YES];
        if (lodingTime == 0) {
            lodingTime = 60;
        }
    }
    else if (timer && isFirst) {
        isFirst = NO;
        [self removeTimer];
        lodingTime--;
        timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(processTimer:)
                                               userInfo:nil repeats:YES];
    }
}

- (void)removeTimer
{
    if (timer && timer.isValid) {
        
        [timer invalidate];
    }
    timer = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resendeCodeButtonMethod:(id)sender {

}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    //[self.navigationController popViewControllerAnimated:YES];
}
@end
