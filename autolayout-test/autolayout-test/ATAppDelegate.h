//
//  ATAppDelegate.h
//  autolayout-test
//
//  Created by Krzysztof Kucharewicz on 7/28/13.
//

#import <UIKit/UIKit.h>

@class ATViewController;

@interface ATAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ATViewController *viewController;

@end
