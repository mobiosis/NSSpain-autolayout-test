//
//  ATOldViewController.m
//  autolayout-test
//
//  Created by Krzysztof Kucharewicz on 07/09/14.
//

#import "ATOldViewController.h"

@interface ATOldViewController ()

@property (weak, nonatomic) UIButton* button;
@property (weak, nonatomic) UIView* line1;
@property (weak, nonatomic) UIView* line2;
@property (weak, nonatomic) UIView* label;

@end

@implementation ATOldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setTitle:NSLocalizedString(@"Test 1", @"test 1 nav bar title")];
    
    [self addLine1];
//    [self addLine2];
    [self addLine2WithWrapper];
    [self addButton];
    
}

- (void)viewDidLayoutSubviews
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addLine1
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    float topMargin = 70;
    float labelWidthBase = screenRect.size.width;

    UILabel* label = [UILabel new];
    label.textAlignment = NSTextAlignmentRight;
    label.text = NSLocalizedString(@"Hello", @"");
    CGSize fitSize = [label sizeThatFits:CGSizeMake(labelWidthBase, 15)];
    label.frame = CGRectMake(8,topMargin, fitSize.width, fitSize.height);
    label.backgroundColor = [UIColor greenColor];
    
    UILabel* label2 = [[UILabel alloc] init];
    label2.backgroundColor = [UIColor yellowColor];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.text = NSLocalizedString(@"NSSpain", @"");
    fitSize = [label2 sizeThatFits:CGSizeMake(labelWidthBase, 15)];
    label2.frame = CGRectMake(label.frame.origin.x+label.frame.size.width + 4,topMargin, fitSize.width, fitSize.height);
    
    UILabel* label3 = [[UILabel alloc] init];
    label3.backgroundColor = [UIColor orangeColor];
    label3.textAlignment = NSTextAlignmentLeft;
    label3.text = NSLocalizedString(@"2014", @"");
    fitSize = [label3 sizeThatFits:CGSizeMake(labelWidthBase, 15)];
    label3.frame = CGRectMake(label2.frame.origin.x+label2.frame.size.width + 4,topMargin, fitSize.width, fitSize.height);
    
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.frame = CGRectMake(0,60,screenRect.size.width,20);
    
    [wrapperView addSubview:label];
    [wrapperView addSubview:label2];
    [wrapperView addSubview:label3];
    
    float wrapperViewWidth = label3.frame.origin.x - label.frame.origin.x + label3.frame.size.width + 8;
    float viewAlignLeft = 8;
    float viewAlignRight = screenRect.size.width - wrapperViewWidth;
    float viewAlignCenter = screenRect.size.width/2-wrapperViewWidth/2;
    wrapperView.frame = CGRectMake(viewAlignCenter, 0, wrapperViewWidth, 15);
    [self.view addSubview:wrapperView];
    
    self.line1 = wrapperView;
}

- (void) addLine2
{
    UIView * view = self.view;
    
    UILabel* label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = NSLocalizedString(@"Presented by", @"");
    label.backgroundColor = [UIColor greenColor];
    //    [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [view addSubview:label];
    
    UILabel* label2 = [UILabel new];
    label2.translatesAutoresizingMaskIntoConstraints = NO;
    label2.backgroundColor = [UIColor orangeColor];
    label2.text = NSLocalizedString(@"Krix", @"");
    [view addSubview:label2];
    
    UILabel* labelPlus = [[UILabel alloc] init];
    labelPlus.translatesAutoresizingMaskIntoConstraints = NO;
    labelPlus.text = NSLocalizedString(@"vel", @"");
    labelPlus.backgroundColor = [UIColor greenColor];
    [view addSubview:labelPlus];
    
    UILabel* label3 = [UILabel new];
    label3.translatesAutoresizingMaskIntoConstraints = NO;
    label3.text = NSLocalizedString(@"@mobiosis", @"");
    label3.backgroundColor = [UIColor yellowColor];
    [view addSubview:label3];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-(8)-[label2]-(8)-[labelPlus]-(8)-[label3]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label, label2, labelPlus, label3)]];
    
    int margin = 80;
    [view addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:margin]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:margin]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:margin]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:labelPlus attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:margin]];
    
    self.line2 = view;
    self.label = label;
}

- (void) addLine2WithWrapper
{
    UIView * view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel* label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = NSLocalizedString(@"Presented by", @"");
    label.backgroundColor = [UIColor greenColor];
    //    [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [view addSubview:label];
    
    UILabel* label2 = [UILabel new];
    label2.translatesAutoresizingMaskIntoConstraints = NO;
    label2.backgroundColor = [UIColor orangeColor];
    label2.text = NSLocalizedString(@"Krix", @"");
    [view addSubview:label2];
    
    UILabel* labelPlus = [[UILabel alloc] init];
    labelPlus.translatesAutoresizingMaskIntoConstraints = NO;
    labelPlus.text = NSLocalizedString(@"vel", @"");
    labelPlus.backgroundColor = [UIColor greenColor];
    [view addSubview:labelPlus];
    
    UILabel* label3 = [UILabel new];
    label3.translatesAutoresizingMaskIntoConstraints = NO;
    label3.text = NSLocalizedString(@"@mobiosis", @"");
    label3.backgroundColor = [UIColor yellowColor];
    [view addSubview:label3];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-(8)-[label2]-(8)-[labelPlus]-(8)-[label3]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label, label2, labelPlus, label3)]];
    
    int margin = 8;
    [view addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:margin]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:margin]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:margin]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:labelPlus attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:margin]];
    
    [self.view addSubview:view];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    id topview = self.topLayoutGuide;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topview]-(80)-[view]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(topview, view)]];
    
    self.line2 = view;
    self.label = label;
}

- (void) addButton
{
    UIButton *button = [UIButton new];
    self.button = button;
    button.backgroundColor = [UIColor grayColor];
    button.tintColor = [UIColor orangeColor];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:NSLocalizedString(@"Exercise layout", @"") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(exerciseLayout:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //add constraints
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

- (void) exerciseLayout:(UIButton *)button
{
    [self.label exerciseAmbiguityInLayout];
}



@end
