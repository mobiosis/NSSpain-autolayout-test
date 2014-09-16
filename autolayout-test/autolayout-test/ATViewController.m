//
//  ATViewController.m
//  autolayout-test
//
//  Created by Krzysztof Kucharewicz on 7/28/13.
//

#import "ATViewController.h"
#import "ATUser.h"
#import "ATUserProfile.h"
#import <UINibWrapper.h>

@interface ATViewController ()
@property (weak, nonatomic) IBOutlet UINibWrapper *userProfile;

@end

@implementation ATViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitle:NSLocalizedString(@"Test 2", @"test 2 nav bar title")];

    [self presentUser];
}

- (void)viewWillLayoutSubviews
{
    float topMargin = self.topLayoutGuide.length;
    NSLog(@"Top layout guide before layout %f", topMargin);
    
}

- (void)viewDidLayoutSubviews
{
    float topMargin = self.topLayoutGuide.length;
    NSLog(@"Top layout guide after layout %f", topMargin);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) presentUser
{
    ATUser *user = [ATUser new];
    [user setValuesForKeysWithDictionary:
     @{@"userName": @"Krzysztof",
       @"userSurname": @"Kucharewicz",
       @"userDescription": @"My name is Krzysztof Kucharewicz. I'm a Polish software developer with a hard to pronounce name (but you can call me Kris). I've been involved in mobile applications since 2006, yet before Steve Jobs defined what \"smart\" in the \"smartphone\" means. I'm currently developing for iOS, Android and Windows Phone. I live in a Barcelona and work for the MobileJazz company, helping startups make their dreams come true.",
       @"userImage": @"avatar.jpg"
       }];
    
    
    [self.userProfile.contentView setUser:user];
}

@end
