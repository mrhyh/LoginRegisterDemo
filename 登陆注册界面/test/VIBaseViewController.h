//
//  VIBaseViewController.h
//  找酒吧
//
//  Created by BWsoft on 14/10/23.
//  Copyright (c) 2014年 BWsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIBaseViewController : UIViewController
- (id)initWithTitle:(NSString *)title withRightButtonTitle:(NSString *)string;
- (void)theRightButtonPressed;

@property (retain, nonatomic) UIView *titleView;
@property (retain, nonatomic) UIButton *backButon;
@property (retain, nonatomic) UIImageView *backLogo;
- (void)backToBefore;

@property (retain, nonatomic) UILabel *noDataLabel;
@property (retain, nonatomic) UIButton *theNext;

@property (retain, nonatomic) UIImageView *titleLineImageView; //导航栏下边框线


@end
