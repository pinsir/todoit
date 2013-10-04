//
//  TBAppDelegate.h
//  ToDoIt
//
//  Created by pin on 13-10-4.
//  Copyright (c) 2013年 dingyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarKit.h"

@interface TBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CKCalendarViewController *viewController;

@end
