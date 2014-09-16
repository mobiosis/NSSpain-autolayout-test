//
//  ATMainViewController.m
//  autolayout-test
//
//  Created by Krzysztof Kucharewicz on 07/09/14.
//

#import "ATMainViewController.h"
#import "ATOldViewController.h"
#import <Lyt.h>

@interface ATMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation ATMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:NSLocalizedString(@"Autolayouts for Everyone", @"app nav bar title")];
    
//    [self animateLogo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)test1:(id)sender {
    [self.navigationController pushViewController:[ATOldViewController new] animated:YES];
}

- (void) animateLogo
{
    //create a UIImageView
    UIImageView *imageView = [UIImageView new];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.image = [UIImage imageNamed:@"logo"];

    //add it to the parent view, centered
    [self.view addSubview:imageView];
    NSArray *imageCenteredConstraints = [imageView lyt_centerInParent];
    //lay it out
    [self.view layoutIfNeeded];
    
    //hide buttons temprarily
    self.button1.alpha = 0;
    self.button2.alpha = 0;
    
    //because we have added a new constraint just now,
    //we need to let the UI repass it before we animate it
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [UIView animateWithDuration:1.5 animations:^{
            [self.view removeConstraints:imageCenteredConstraints];
            //horizontal alignment
            [imageView lyt_centerXInParent];
            //vertical alignment
            [imageView lyt_placeBelowView:(UIView*)self.topLayoutGuide margin:10];
            
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                self.button1.alpha = 1;
                self.button2.alpha = 1;
            }];
        }];
    
    });
    
}
@end
