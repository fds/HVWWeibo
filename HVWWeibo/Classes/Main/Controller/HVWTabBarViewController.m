//
//  HVWTabBarViewController.m
//  HVWWeibo
//
//  Created by hellovoidworld on 15/1/31.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWTabBarViewController.h"
#import "HVWHomeViewController.h"
#import "HVWMessageViewController.h"
#import "HVWDiscoverViewController.h"
#import "HVWProfileViewController.h"
#import "HVWNavigationViewController.h"

@interface HVWTabBarViewController ()

@end

@implementation HVWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加子控制器
    // 首页
    HVWHomeViewController *homeVC = [[HVWHomeViewController alloc] init];
    [self addChildViewController:homeVC WithTitle:@"首页" image:@"tabbar_home" seletectedImage:@"tabbar_home_selected"];
    
    // 消息
    HVWMessageViewController *messageVC = [[HVWMessageViewController alloc] init];
    [self addChildViewController:messageVC WithTitle:@"消息" image:@"tabbar_message_center" seletectedImage:@"tabbar_message_center_selected"];
    
    // 发现
    HVWDiscoverViewController *discoverVC = [[HVWDiscoverViewController alloc] init];
    [self addChildViewController:discoverVC WithTitle:@"发现" image:@"tabbar_discover" seletectedImage:@"tabbar_discover_selected"];
    
    // 我
    HVWProfileViewController *profileVC = [[HVWProfileViewController alloc] init];
    [self addChildViewController:profileVC WithTitle:@"我" image:@"tabbar_profile" seletectedImage:@"tabbar_profile_selected"];
    
}

/** 添加tab子控制器 */
- (void) addChildViewController:(UIViewController *) viewController WithTitle:(NSString *) title image:(NSString *) imageName seletectedImage:(NSString *) selectedImageName {
    
    // 设置随机背景色
//    viewController.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0];
    
    // 设置标题，直接设置title可以同时设置tabBarItem和navigationItem的title
//    viewController.tabBarItem.title = title;
//    viewController.navigationItem.title = title;
    viewController.title = title;
    
    // 设置图标
    viewController.tabBarItem.image = [UIImage imageWithNamed:imageName];
    
    // 被选中时图标
    UIImage *selectedImage = [UIImage imageWithNamed:selectedImageName];
    // 如果是iOS7，不要渲染被选中的tab图标（iOS7中会自动渲染成为蓝色）
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    viewController.tabBarItem.selectedImage = selectedImage;
    
    // 添加子控制器
    HVWNavigationViewController *nav = [[HVWNavigationViewController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
}


@end