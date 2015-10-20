//
//  UIView+AutolayoutView.m
//
//  Created by Chandler De Angelis on 4/6/15.
//  Copyright (c) 2015 Flipagram LLC. All rights reserved.
//

#import "UIView+AutolayoutView.h"

@implementation UIView (AutolayoutView)
#pragma mark - Public Methods

+ (instancetype)autolayoutView
{
    UIView *view = [[[self class] alloc] initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

- (void)pinToAllSidesOfParent
{
    [self pinToEdgesOfParent:TopEdge|RightEdge|BottomEdge|LeftEdge];
}

- (NSLayoutConstraint *)pinToEdgeOfParent:(NSLayoutAttribute)attribute spacing:(CGFloat)spacing
{
    return [self pinToSuperviewWithAttribute:attribute
                                  multiplier:1.0
                                    constant:spacing];
}

- (NSLayoutConstraint *)pinToEdgeOfParent:(NSLayoutAttribute)attribute
{
    return [self pinToEdgeOfParent:attribute spacing:0.0];
}

- (void)pinToEdgesOfParent:(SuperviewEdges)edges
{
    if (edges & TopEdge) {
        [self pinToEdgeOfParent:NSLayoutAttributeTop];
    }
    
    if (edges & RightEdge) {
        [self pinToEdgeOfParent:NSLayoutAttributeRight];
    }
    
    if (edges & BottomEdge) {
        [self pinToEdgeOfParent:NSLayoutAttributeBottom];
    }
    
    if (edges & LeftEdge) {
        [self pinToEdgeOfParent:NSLayoutAttributeLeft];
    }
}

- (NSLayoutConstraint *)pinToSuperviewWithAttribute:(NSLayoutAttribute)attribute
                                         multiplier:(CGFloat)multiplier
                                           constant:(CGFloat)constant
{
    UIView *superview = [self superview];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:attribute
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:superview
                                                                  attribute:attribute
                                                                 multiplier:multiplier
                                                                   constant:constant];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)pinToSuperviewWithAttribute:(NSLayoutAttribute)attribute
                                           constant:(CGFloat)constant
{
    return [self pinToSuperviewWithAttribute:attribute multiplier:1.0f constant:constant];
}

- (void)pinToEdgeOfSiblingView:(UIView *)view
                     attribute:(NSLayoutAttribute)attribute
                      constant:(CGFloat)constant
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                              attribute:attribute
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:view
                                                              attribute:attribute
                                                             multiplier:1.0
                                                                constant:constant]];
}

- (void)alignAxisToSuperviewAxis:(NSLayoutAttribute)axis
{
    [self alignToSuperviewLayoutAttribute:axis
                               multiplier:1.0
                                 constant:0.0];
}

- (void)alignAxisToSuperviewAxis:(NSLayoutAttribute)axis constant:(CGFloat)constant
{
    [self alignToSuperviewLayoutAttribute:axis
                               multiplier:1.0
                                 constant:constant];
}

- (void)alignAxisToSuperviewAxis:(NSLayoutAttribute)axis multiplier:(CGFloat)multiplier
{
    [self alignToSuperviewLayoutAttribute:axis
                               multiplier:multiplier
                                 constant:0.0];
}

- (void)alignAxis:(NSLayoutAttribute)axis toAxisOfView:(UIView *)view
{
    [self alignAxis:axis toAxisOfView:view constant:0.0];
}

- (void)alignToSuperviewLayoutAttribute:(NSLayoutAttribute)attribute
                             multiplier:(CGFloat)multiplier
                               constant:(CGFloat)constant
{
    UIView *superview = [self superview];
    if (superview) {
        [superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                              attribute:attribute
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:superview
                                                              attribute:attribute
                                                             multiplier:multiplier
                                                               constant:constant]];
    }
}

- (void)alignAxis:(NSLayoutAttribute)axis
     toAxisOfView:(UIView *)view
         constant:(CGFloat)constant
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:axis
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view
                                                               attribute:axis
                                                              multiplier:1.0
                                                                constant:constant]];
}

- (NSLayoutConstraint *)addWidthConstraint:(CGFloat)constant
{
    return [self addAttribute:NSLayoutAttributeWidth
                 withRelation:NSLayoutRelationEqual
                   multiplier:1.0
                     constant:constant];
}

- (NSLayoutConstraint *)addHeightConstraint:(CGFloat)constant
{
    return [self addAttribute:NSLayoutAttributeHeight
                 withRelation:NSLayoutRelationEqual
                   multiplier:1.0
                     constant:constant];
}

- (NSLayoutConstraint *)addWidthAndHeightConstraints:(CGFloat)constant
{
    [self addWidthConstraint:constant];
    return [self addHeightConstraint:constant];
}

- (void)addEqualWidthsToView:(UIView *)view
{
    [self addEqualWidthsToView:view withOffset:0.0f];
}

- (void)addEqualWidthsToView:(UIView *)view withOffset:(CGFloat)offset
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view
                                                               attribute:NSLayoutAttributeWidth
                                                              multiplier:1.0
                                                                constant:offset]];
}

- (void)addEqualWidthsToView:(UIView *)view withMultiplier:(CGFloat)multiplier
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view
                                                               attribute:NSLayoutAttributeWidth
                                                              multiplier:multiplier
                                                                constant:1.0]];
}

- (void)addEqualHeightsToView:(UIView *)view withMultiplier:(CGFloat)multiplier
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view
                                                               attribute:NSLayoutAttributeHeight
                                                              multiplier:multiplier
                                                                constant:1.0]];
}

- (void)addEqualHeightsToView:(UIView *)view
{
    if (self.superview == view.superview) {
        [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:view
                                                                   attribute:NSLayoutAttributeHeight
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    }
}


- (void)addSpacingWithAttribute:(NSLayoutAttribute)firstAttribute
                   betweenView:(UIView *)view
                 withAttribute:(NSLayoutAttribute)secondAttribute
                    multiplier:(CGFloat)multiplier
                      constant:(CGFloat)constant
{
    [[self superview] addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:firstAttribute
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:view
                                                     attribute:secondAttribute
                                                    multiplier:multiplier
                                                      constant:constant]];
}

- (void)addSpacingWithAttribute:(NSLayoutAttribute)firstAttribute
                   betweenView:(UIView *)view
                 withAttribute:(NSLayoutAttribute)secondAttribute
                      constant:(CGFloat)constant
{
    [self addSpacingWithAttribute:firstAttribute betweenView:view withAttribute:secondAttribute multiplier:1.0f constant:constant];
}

- (void)addSpacingWithAttribute:(NSLayoutAttribute)firstAttribute
                   betweenView:(UIView *)view
                 withAttribute:(NSLayoutAttribute)secondAttribute
{
    [self addSpacingWithAttribute:firstAttribute betweenView:view withAttribute:secondAttribute constant:0.0f];
}

- (NSLayoutConstraint *)addAttribute:(NSLayoutAttribute)attribute
                        withRelation:(NSLayoutRelation)relation
                          multiplier:(CGFloat)multiplier
                            constant:(CGFloat)constant
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:attribute
                                                                  relatedBy:relation
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:multiplier
                                                                   constant:constant];
    [self addConstraint:constraint];
    return constraint;
}

- (void)addAttribute:(NSLayoutAttribute)attribute
        withRelation:(NSLayoutRelation)relation
            constant:(CGFloat)constant
{
    [self addAttribute:attribute withRelation:relation multiplier:1.0f constant:constant];
}

- (void)addAttribute:(NSLayoutAttribute)attribute
        withRelation:(NSLayoutRelation)relation
{
    [self addAttribute:attribute withRelation:relation constant:0.0f];
}

- (void)addRelation:(NSLayoutRelation)relation
             toView:(UIView *)view
      withAttribute:(NSLayoutAttribute)attribute
         multiplier:(CGFloat)multiplier
           constant:(CGFloat)constant
{
    [[self superview] addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                                 attribute:attribute
                                                                 relatedBy:relation
                                                                    toItem:view
                                                                 attribute:attribute
                                                                multiplier:multiplier
                                                                  constant:constant]];
}

- (void)addRelation:(NSLayoutRelation)relation
             toView:(UIView *)view
      withAttribute:(NSLayoutAttribute)attribute
           constant:(CGFloat)constant
{
    [self addRelation:relation toView:view withAttribute:attribute multiplier:1.0f constant:constant];
}

- (void)addRelation:(NSLayoutRelation)relation
             toView:(UIView *)view
      withAttribute:(NSLayoutAttribute)attribute
{
    [self addRelation:relation toView:view withAttribute:attribute constant:0.0f];
}

- (void)addAspectWidth:(CGFloat)widthMultiplier aspectHeight:(CGFloat)heightMultiplier
{
    NSLayoutConstraint *widthConstraint = nil;
    NSLayoutConstraint *heightConstraint = nil;
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth && constraint.secondAttribute == NSLayoutAttributeNotAnAttribute) {
            widthConstraint = constraint;
        } else if (constraint.firstAttribute == NSLayoutAttributeHeight && constraint.secondAttribute == NSLayoutAttributeNotAnAttribute) {
            heightConstraint = constraint;
        }
    }
    
    if (!widthConstraint && !heightConstraint) {
        NSAssert(YES, @"You must have a width or height constraint installed", nil);
        return;
    }
    
    if (widthConstraint && !heightConstraint) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:heightMultiplier constant:0.0]];
    } else if (heightConstraint && !widthConstraint) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:widthMultiplier constant:0.0]];
    }
}

@end
