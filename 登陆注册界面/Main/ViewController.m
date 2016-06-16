//
//  ViewController.m
//  test
//
//  Created by ylgwhyh on 15/11/16.
//  Copyright © 2015年 com.hyh. All rights reserved.
//



#import "ViewController.h"
#import "Header.h"
#import "NewRegisterViewController.h"
#import "UIImageView+LBBlurredImage.h"

#pragma mark Register TextField Tag enum
enum TAG_REGISTER_TEXTFIELD{
    
    Tag_PhoneNumberTextField  = 100,    //邮箱
    Tag_CodeTextField ,        //用户名
    Tag_TempPasswordTextField,    //登录密码
    Tag_ConfirmPasswordTextField, //确认登录密码
};

@interface ViewController ()<UITextFieldDelegate>
{
    UIView *titleView;
    UITextField *_passwordTextField;
    UITextField *_userNameTextField;
    
    UIButton *registerBtn;
    UIImageView *passwordImage;
    UIImageView *userNameImage;
    UIButton *login;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.titleLineImageView setHidden:YES];
    
    //背景图
    UIImageView *backgroundImage = [[UIImageView alloc] init];
    backgroundImage.frame = [[UIApplication sharedApplication].delegate window].frame;
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    
    [backgroundImage setImageToBlur:[UIImage imageNamed:@"1.png"]
                         blurRadius:6
                    completionBlock:^(NSError *error){
                        // NSLog(@"The blurred image has been setted");
                    }];
    
    [self.view addSubview:backgroundImage];
    
    
    //左按钮
    CGFloat buttonWidth  = 40;
    CGFloat buttonHeight = 40;
    UIImageView  *leftImage=[[UIImageView alloc] init];
    leftImage.frame = CGRectMake(15, 30, 25, 25);
    [leftImage setImage:[UIImage imageNamed:@"cha"]];
    [self.view addSubview:leftImage];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(0, 0, buttonWidth, buttonHeight);
    [leftButton addTarget:self action:@selector(clickLeftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    

    //用户头像
    UIImageView *smallPicImageView = [[UIImageView alloc]init];
    smallPicImageView.bounds = CGRectMake(0, 0, GET_VIEWCONTROLLER_WIDTH / 4, GET_VIEWCONTROLLER_WIDTH / 4);
    smallPicImageView.center = CGPointMake(GET_VIEWCONTROLLER_WIDTH /2, GET_VIEWCONTROLLER_HEIGHT / 4.5);
    smallPicImageView.layer.cornerRadius = smallPicImageView.bounds.size.width / 2;
    smallPicImageView.layer.masksToBounds = YES;
    smallPicImageView.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:smallPicImageView];
    
    //用户名、密码背景view
    UIView *namePasswordBackGroundView = [[UIView alloc] init];
    namePasswordBackGroundView.frame = CGRectMake(0, smallPicImageView.frame.origin.y + smallPicImageView.frame.size.height + 60, GET_VIEWCONTROLLER_WIDTH, GET_VIEWCONTROLLER_HEIGHT / 13 * 2 + 1);
    namePasswordBackGroundView.backgroundColor = [UIColor whiteColor];
    namePasswordBackGroundView.alpha = 0.5;
    [self.view addSubview:namePasswordBackGroundView];
    
    //用户名
    CGFloat namePasswordY = smallPicImageView.frame.origin.y + smallPicImageView.frame.size.height + 60;
    CGFloat namePasswordBtnHeight = GET_VIEWCONTROLLER_HEIGHT / 13;
    UIView *namePasswordBackgroundView = [[UIView alloc] init];
    [namePasswordBackgroundView setFrame:CGRectMake(0, namePasswordY, GET_VIEWCONTROLLER_WIDTH, namePasswordBtnHeight)];
    
    UIView *userNameView = [[UIView alloc] init];
    [userNameView setFrame:CGRectMake(0, namePasswordY, GET_VIEWCONTROLLER_WIDTH, namePasswordBtnHeight)];
    userNameView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:userNameView];
    
    userNameImage = [[UIImageView alloc] init];
    [userNameImage setBounds:CGRectMake(0, 0, 3 * CGRectGetHeight(userNameView.bounds) / 5, CGRectGetHeight(userNameView.bounds))];
    [userNameImage setCenter:CGPointMake(CGRectGetWidth(userNameView.bounds) / 8, CGRectGetMidY(userNameView.bounds))];
    [userNameImage setContentMode:UIViewContentModeScaleAspectFit];
    [userNameImage setImage:[UIImage imageNamed:@"Name_Select.png"]];
    [userNameView addSubview:userNameImage];
    
    _userNameTextField = [[UITextField alloc] init];
    [_userNameTextField setBounds:CGRectMake(0, 0, CGRectGetMidX(userNameView.bounds)+ 60, CGRectGetHeight(userNameView.bounds))];
    [_userNameTextField setCenter:CGPointMake(CGRectGetMidX(userNameView.bounds) + 30, CGRectGetMidY(userNameView.bounds))];
    _userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    UIColor *color = [UIColor colorWithWhite:0.467 alpha:1.000];
    [_userNameTextField setTextColor:color];
    _userNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.delegate = self;
    [_userNameTextField setFont:[UIFont systemFontOfSize:16]];
    _userNameTextField.tag = 100001;
    _userNameTextField.text = @"123"; //显示上次的登录账号
#pragma mark TextField实时监听
    [_userNameTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [userNameView addSubview:_userNameTextField];
    
    
    
    
    UIImageView *imageLineTwo = [[UIImageView alloc] init];
    imageLineTwo.frame = CGRectMake(0, userNameView.frame.origin.y + namePasswordBtnHeight, GET_VIEWCONTROLLER_WIDTH, 0.3);
    imageLineTwo.center = CGPointMake(GET_VIEWCONTROLLER_WIDTH / 2, userNameView.frame.origin.y + namePasswordBtnHeight);
    imageLineTwo.alpha = 0.8;
    imageLineTwo.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageLineTwo];
    
    
    //密码
    UIView *passwordView = [[UIView alloc] init];
    passwordView.frame = CGRectMake(0, userNameView.frame.origin.y  + namePasswordBtnHeight + 1, GET_VIEWCONTROLLER_WIDTH, namePasswordBtnHeight);
    [self.view addSubview:passwordView];
    
    passwordImage = [[UIImageView alloc] init];
    [passwordImage setBounds:CGRectMake(0, 0, 3 * CGRectGetHeight(passwordView.bounds) / 5, 3.5 * CGRectGetHeight(passwordView.bounds) / 5)];
    [passwordImage setCenter:CGPointMake(CGRectGetWidth(passwordView.bounds) / 8, CGRectGetMidY(passwordView.bounds))];
    [passwordImage setContentMode:UIViewContentModeScaleAspectFit];
    [passwordImage setImage:[UIImage imageNamed:@"Password_NoSelect.png"]];
    [passwordView addSubview:passwordImage];
    
    _passwordTextField = [[UITextField alloc] init];
    [_passwordTextField setBounds:CGRectMake(0, 0, CGRectGetMidX(passwordView.bounds) + 60, CGRectGetHeight(passwordView.bounds))];
    [_passwordTextField setCenter:CGPointMake(CGRectGetMidX(passwordView.bounds) + 30, CGRectGetMidY(passwordView.bounds))];
    [_passwordTextField setTextColor:color];
    _passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    _passwordTextField.placeholder = @"请输入密码";
    [_passwordTextField setSecureTextEntry:YES];
    _passwordTextField.delegate = self;
    [_passwordTextField setFont:[UIFont systemFontOfSize:16]];
    _passwordTextField.tag = 100002;
    [passwordView addSubview:_passwordTextField];

    
    //登录按钮
    login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor clearColor]);
    [login setBackgroundImage:[UIImage imageNamed:@"Login_Normal.png"] forState:UIControlStateNormal];
    
    login.contentMode = UIViewContentModeScaleAspectFit;
    [login setBounds:CGRectMake(0, 0, GET_VIEWCONTROLLER_WIDTH - 60,  namePasswordBtnHeight)];
    
    CGFloat loginY = passwordView.frame.origin.y + passwordView.frame.size.height + login.frame.size.height / 2 + 30;
    [login setCenter:CGPointMake(GET_VIEWCONTROLLER_WIDTH / 2,loginY)];
    [login setTitle:@"登        录" forState:UIControlStateNormal];
    [login setTintColor:[UIColor whiteColor]];
    login.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    login.layer.shadowOffset = CGSizeMake(1, 1);
    login.layer.shadowColor = [UIColor colorWithRed:0.655 green:0.000 blue:0.518 alpha:1.000].CGColor;
    login.layer.shadowOpacity = 0.1;
    [login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    login.layer.cornerRadius = login.frame.size.height / 2;
    login.layer.borderWidth = 1;
    [self.view addSubview:login];
    
    CGFloat fontY = login.frame.origin.y + login.frame.size.height + 10;
    CGFloat registerLoginHeight = GET_VIEWCONTROLLER_HEIGHT / 30;

    //中间白色的线
    UIImageView *imageLine = [[UIImageView alloc] init];
    imageLine.frame =  CGRectMake(GET_VIEWCONTROLLER_WIDTH / 2,fontY, 0.6, registerLoginHeight);
    imageLine.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageLine];
    
    
    //账号注册
    CGFloat distance = 15; //账号注册 和 忘记密码距离中线的距离
    registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setTitle:@"账号注册" forState:UIControlStateNormal];
    NSString *registerString = @"账号注册";
    CGSize registerStringFontSize = [registerString sizeWithAttributes:
                                     @{NSFontAttributeName:
                                           [UIFont fontWithName:@"Helvetica" size:14]}];
    
    registerBtn.frame = CGRectMake(GET_VIEWCONTROLLER_WIDTH / 2 - distance - registerStringFontSize.width,fontY,  registerStringFontSize.width, registerLoginHeight);

    registerBtn.titleLabel.tintColor = [UIColor whiteColor];
    [registerBtn addTarget:self action:@selector(registerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:registerBtn];
    
    
    //忘记密码
    UIButton *forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPassword setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forgetPassword.titleLabel.tintColor = [UIColor whiteColor];
    NSString *forgetPasswordString = @"忘记密码？";
    CGSize forgetPasswordFontSize = [forgetPasswordString sizeWithAttributes:
                                     @{NSFontAttributeName:
                                           [UIFont fontWithName:@"Helvetica" size:14]}];
     forgetPassword.frame = CGRectMake(GET_VIEWCONTROLLER_WIDTH / 2 + distance, fontY, forgetPasswordFontSize.width, registerLoginHeight);
    forgetPassword.titleLabel.tintColor = [UIColor whiteColor];
    [forgetPassword addTarget:self action:@selector(forgetPasswordButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    forgetPassword.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:forgetPassword];
    
    // 2.监听键盘的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)registerButtonPressed{

    NewRegisterViewController *vc = [[NewRegisterViewController alloc] init];
    NewRegisterViewController *registerViewController = [[NewRegisterViewController alloc] init];
    self.navigationController.navigationBarHidden = YES;
    
    NSLog(@"self.navigationController =", self.navigationController);
    //[self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:^{
    }];

}


- (void)forgetPasswordButtonPressed{
    NSLog(@"forgetPasswordButtonPressed...");
}

#pragma -mark 键盘frame改变
/**
 *  当键盘改变了frame(位置和尺寸)的时候调用
 */
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 这个note是一个字典数组，里面保存的时键盘的各种属性，打印出来如下面注释部分
    //   NSLog(@"%@",note.userInfo);
    // 设置窗口的颜色
    //self.view.window.backgroundColor = self.tableView.backgroundColor;
    
    // doubleValue 是将从note.userInfo中取出的键盘的属性(结构体)转换为具体的值，CGRectValue这些都是这样的。
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY;
    if(keyboardFrame.origin.y < (login.frame.origin.y + login.frame.size.height)){
        transformY =(login.frame.origin.y + login.frame.size.height) - keyboardFrame.origin.y;
        
        // 3.执行动画
        [UIView animateWithDuration:duration animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, -transformY);
        }];
    }else{
       // transformY = 0;
    }

}

/**
 *  键盘即将退出的时候调用
 */
- (void)keyboardWillHide:(NSNotification *)note
{
    // 1.取出键盘弹出的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)clickLeftButtonAction{
    [self backToBefore];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark----textFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textFiel
{
    switch (textFiel.tag) {
        case Tag_PhoneNumberTextField:
            
                        break;
            
        case Tag_CodeTextField:
                      break;
            
        case Tag_TempPasswordTextField:
                        break;
            
        case Tag_ConfirmPasswordTextField:
            
                        break;
            
        default:
            break;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if((textField.tag == 100001)){
        [userNameImage setImage:[UIImage imageNamed:@"Name_Select.png"]];
        [passwordImage setImage:[UIImage imageNamed:@"Password_NoSelect.png"]];
    }else if((textField.tag == 100002)){
        [userNameImage setImage:[UIImage imageNamed:@"Name_NoSelect.png"]];
        [passwordImage setImage:[UIImage imageNamed:@"Password_Select.png"]];
    }
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([textField isEqual:_userNameTextField]) {
        
        if (range.location > 10) {
            return NO;
        }else {
            return YES;
        }
    }
    else {
        
        if (range.location > 15) {
            return NO;
        }else {
            return YES;
        }
    }
}

- (void) textFieldDidChange:(UITextField *) textField {
    NSLog(@"%@",textField.text);
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return NO;
}

//键盘回收(点击空白)
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//返回上一级
- (void)backToBefore
{
    [self.navigationController popViewControllerAnimated:YES];
    //跳转tabBar界面
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"tabBarSelectIndex" object:nil];
}


@end
