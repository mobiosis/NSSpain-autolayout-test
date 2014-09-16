//
//  ATUserProfile.m
//  autolayout-test
//
//  Created by Krzysztof Kucharewicz on 14/09/14.
//

#import "ATUserProfile.h"

@interface ATUserProfile()
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ATUserProfile

- (void)awakeFromNib
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.image attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1./3 constant:0]];
    [self layoutIfNeeded];
}

- (void)setUser:(ATUser *)user
{
    UIImage *profileImage = [UIImage imageNamed:user.userImage];
    [self.image setImage:profileImage];
    self.firstNameLabel.text = user.userName;
    self.lastNameLabel.text = user.userSurname;
    self.descriptionLabel.text = user.userDescription;
}

@end
