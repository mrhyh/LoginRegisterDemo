//
//  VIBaseViewController.m
//  找酒吧
//
//  Created by BWsoft on 14/10/23.
//  Copyright (c) 2014年 BWsoft. All rights reserved.
//

#import "VIBaseViewController.h"
#import "Header.h"

@interface VIBaseViewController () {
    NSString *rightButtonString;
    UIImageView *backImage;
}

@end

@implementation VIBaseViewController

- (id)initWithTitle:(NSString *)title withRightButtonTitle:(NSString *)string {
    self = [super init];
    if (self) {
        self.title = title;
        rightButtonString = string;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initializeWithBaseUserInterface];
}

- (void)initializeWithBaseUserInterface {
    [self.view setBackgroundColor:VIEW_BACKGROUND_COLOR];
    //标题栏
    _titleView = [[UIView alloc] init];
    [_titleView setFrame:CGRectMake(0, 0, GET_VIEWCONTROLLER_WIDTH, 44 + AddHeight )];
    [_titleView setBackgroundColor:[UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1.000]];
    [self.view addSubview:_titleView];
    
    //返回
    _backButon = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButon setBounds:CGRectMake(0, 0, GET_VIEWCONTROLLER_WIDTH / 4, GET_VIEWCONTROLLER_HEIGHT / 15)];
    [_backButon setCenter:CGPointMake(CGRectGetWidth(_titleView.bounds) / 8, 2.1 * CGRectGetHeight(_titleView.bounds) / 3)];

    
    [_backButon addTarget:self action:@selector(backToBefore) forControlEvents:UIControlEventTouchUpInside];
    [_backButon addTarget:self action:@selector(changeHighlighted) forControlEvents:UIControlEventTouchDown];
    [_backButon setTitleColor:SELF_COLOR_GRAY forState:UIControlStateNormal];
    [_backButon setTitleColor:SELF_HIGHTLIGHTED_COLOR_GRAY forState:UIControlStateHighlighted];

    _backButon.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_titleView addSubview:_backButon];
    
    
    backImage = [[UIImageView alloc] init];
    backImage.frame = CGRectMake(12, 8, 12, 22);
    backImage.image = pictureFile(BACK_BUTTON_IMAGE);
    backImage.contentMode = UIViewContentModeScaleAspectFit;
    
    [_backButon addSubview:backImage];
    
    
    _theNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [_theNext setBounds:CGRectMake(0, 0, GET_VIEWCONTROLLER_WIDTH / 4, GET_VIEWCONTROLLER_HEIGHT / 15)];
    [_theNext setCenter:CGPointMake(10 * CGRectGetWidth(_titleView.bounds) / 11 + 1, 2.1 * CGRectGetHeight(_titleView.bounds) / 3)];
    [_theNext setTitle:rightButtonString forState:UIControlStateNormal];
    [_theNext setTitleColor:SELF_COLOR_GRAY forState:UIControlStateNormal];
    [_theNext setTitleColor:SELF_HIGHTLIGHTED_COLOR_GRAY forState:UIControlStateHighlighted];
    [_theNext addTarget:self action:@selector(theRightButtonPressed) forControlEvents:UIControlEventTouchUpInside];

    _theNext.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_titleView addSubview:_theNext];
    
    
    //标题
    UILabel *viewTitle = [[UILabel alloc] init];
    [viewTitle setBounds:CGRectMake(0, 0, GET_VIEWCONTROLLER_WIDTH / 2, GET_VIEWCONTROLLER_HEIGHT / 16)];
    [viewTitle setCenter:CGPointMake(GET_VIEWCONTROLLER_WIDTH / 2, 4.7 * CGRectGetHeight(_titleView.bounds) / 7)];
    [viewTitle setTextAlignment:NSTextAlignmentCenter];
    [viewTitle setTextColor:TITLE_LABEL_TEXTCOLOR];
    [viewTitle setFont:TITLE_LABEL_FONT];
    [viewTitle setText:self.title];
    [_titleView addSubview:viewTitle];
    
    _noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, GET_VIEWCONTROLLER_HEIGHT / 2, GET_VIEWCONTROLLER_WIDTH, 50)];
    _noDataLabel.text = @"暂无数据";
    _noDataLabel.textColor = [UIColor blackColor];
    _noDataLabel.textAlignment = NSTextAlignmentCenter;
    _noDataLabel.hidden = YES;
    [self.view addSubview:_noDataLabel];
    
    _titleLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleView.frame) - 0.5, GET_VIEWCONTROLLER_WIDTH, 0.5)];
    _titleLineImageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_titleLineImageView];
}

- (void)backToBefore {
    NSURLConnection *connection;
    [connection cancel];
    backImage.image = pictureFile(BACK_BUTTON_IMAGE);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeHighlighted {
    backImage.image = pictureFile(BACK_HIGHLIGHTED_IMAGE);
}

- (void)theRightButtonPressed {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
