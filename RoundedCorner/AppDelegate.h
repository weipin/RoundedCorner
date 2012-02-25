//
//  AppDelegate.h
//  RoundedCorner
//
//  Created by Weipin Xia on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const NSUInteger kAppTableViewRows;
extern const CGFloat kAppTableViewRowHeight;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
