//
//  Header.h
//  找酒吧
//
//  Created by pcm on 14-10-11.
//  Copyright (c) 2014年 pcm. All rights reserved.
//

#ifndef ____Header_h
#define ____Header_h

#define GET_VIEWCONTROLLER_WIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define GET_VIEWCONTROLLER_HEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

#define RANK_BUTTON_TAG @[@"10", @"11", @"12"]
#define TDTABBAR_VIEW_TAG @[@"20", @"21", @"22", @"23", @"24"]
#define TDTADBAR_BUTTON_TAG @[@"30", @"31", @"32", @"33", @"34"]
#define HOME_BUTTON_TAG @[@"40"]

#define MAX_PAGE_INDEX 10

#define LONGITUDE viSington.userLocation.location.coordinate.longitude
#define LATITUDE viSington.userLocation.location.coordinate.latitude

#define pictureFile(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:(name)]]

//加号减号图片
#define MINUS_GRAY @"down_order_0.png"
#define MINUS_PURPLE @"down_order_1.png"
#define PLUS_GRAY @"up_order_0.png"
#define PLUS_PURPLE @"up_order_1.png"

#define PHOTO_COVER_IMAGE @"final_user_13.png"

//点赞
#define PRAISE_PIC @"lover.png"
#define NOT_PRAISE_PIC @"not_lover.png"
#define FOCUS_PIC @"focus.png"
#define NOT_FOCUS_PIC @"not_focus.png"

#define UM_APP_KEY @"54602a2ffd98c5dc0f002cf3"

//延迟时间
#define DELAY_IN_SENCONDS 10.0

//默认图
#define PLACEHOLDER_IMAGE @"ic_account_head.png"

#define ADVANCED_TAG 50

// RGB颜色设定
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//统一粉色
#define SELF_COLOR [UIColor colorWithRed:0.841 green:0.000 blue:0.660 alpha:1.000]
#define SELF_HIGHTLIGHTED_COLOR [UIColor colorWithRed:0.976 green:0.148 blue:0.902 alpha:1.000]

//统一灰色
#define SELF_COLOR_GRAY [UIColor colorWithRed:121/255.0f green:121/255.0f blue:121/255.0f alpha:1.000]
#define SELF_HIGHTLIGHTED_COLOR_GRAY [UIColor colorWithRed:121/255.0f green:121/255.0f blue:121/255.0f alpha:1.000]
//页面背景
#define VIEW_BACKGROUND_COLOR [UIColor colorWithWhite:0.961 alpha:1.000]

//酒吧类型颜色
#define BLUE_COLOR [UIColor colorWithRed:37 / 255.0 green:191 / 255.0 blue:222 / 255.0 alpha:1.0]
#define GREEN_COLOR [UIColor colorWithRed:53 / 255.0 green:186 / 255.0 blue:122 / 255.0 alpha:1.0]
#define YELLOW_COLOR [UIColor colorWithRed:221 / 255.0 green:182 / 255.0 blue:18 / 255.0 alpha:1.0]

#define LINE_COLOR [UIColor colorWithWhite:0.8 alpha:1]

//是否为iOS 7.0之后
#define after_iOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

//状态栏高度 - 适配iOS7
#define AddHeight (after_iOS7 ? 20 : 0)

//客户服务接口

//#define GET_URL @"http://118.123.10.135:8020/saloonapi/appservices.asmx/CallMethod"
//#define FIRST_PIC_URL @"http://118.123.10.135:8020/FileServer/UploadImage_Phone.ashx"

//外网接口域名
//#define GET_URL @"http://api.zhao98.cn/saloonapi/appservices.asmx/CallMethod"
//#define FIRST_PIC_URL @"http://api.zhao98.cn/FileServer/UploadImage_Phone.ashx"

//外网测试地址
#define GET_URL @"http://test.zhao98.cn/saloonapi/appservices.asmx/CallMethod"
#define FIRST_PIC_URL @"http://test.zhao98.cn/FileServer/UploadImage_Phone.ashx"

//云铠电脑
//#define GET_URL @"http://192.168.0.104/saloonapi/appservices.asmx/CallMethod"
//#define FIRST_PIC_URL @"http://test.zhao98.cn/FileServer/UploadImage_Phone.ashx"

//外网新域名
//http://api.zhao98.cn/
//http://192.168.1.126/SearchBarAPI内部接口

//内网
//#define GET_URL @"http://192.168.0.108/saloonapi/appservices.asmx/CallMethod"
//#define FIRST_PIC_URL @"http://192.168.0.108/FileServer/UploadImage_Phone.ashx"

//应用程序代理
#define APPDELEGATE (AppDelegate *)[[UIApplication sharedApplication] delegate]

//点击事件图片
#define BUTTON_PRE_IMAGE @"buttonback.png"

//返回按钮图片
#define BACK_BUTTON_IMAGE @"ic_back_btn.png"
#define BACK_HIGHLIGHTED_IMAGE @"ic_back_btn_highlighted.png"
#define TITLE_LABEL_TEXTCOLOR [UIColor blackColor]

#define TITLE_LABEL_FONT  [UIFont systemFontOfSize:19]


#endif
