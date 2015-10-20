//
//  UIView+AutolayoutView.h
//
//  Created by Chandler De Angelis on 4/6/15.
//  Copyright (c) 2015 Flipagram LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, SuperviewEdges) {
    LeftEdge = 1 << 0,
    TopEdge = 1 << 1,
    RightEdge = 1 << 2,
    BottomEdge = 1 << 3
};

@interface UIView (AutolayoutView)

+ (instancetype)autolayoutView;

- (void)pinToAllSidesOfParent;

- (NSLayoutConstraint *)pinToEdgeOfParent:(NSLayoutAttribute)attibute spacing:(CGFloat)spacing;

- (NSLayoutConstraint *)pinToEdgeOfParent:(NSLayoutAttribute)attribute;

- (void)pinToEdgesOfParent:(SuperviewEdges)edges;

- (NSLayoutConstraint *)pinToSuperviewWithAttribute:(NSLayoutAttribute)attribute
                         multiplier:(CGFloat)multiplier
                           constant:(CGFloat)constant;

- (NSLayoutConstraint *)pinToSuperviewWithAttribute:(NSLayoutAttribute)attribute
                           constant:(CGFloat)constant;

- (void)pinToEdgeOfSiblingView:(UIView *)view
                     attribute:(NSLayoutAttribute)attr
                      constant:(CGFloat)constant;

- (void)alignAxisToSuperviewAxis:(NSLayoutAttribute)axis;
- (void)alignAxisToSuperviewAxis:(NSLayoutAttribute)axis constant:(CGFloat)constant;
- (void)alignAxisToSuperviewAxis:(NSLayoutAttribute)axis multiplier:(CGFloat)multiplier;
- (void)alignAxis:(NSLayoutAttribute)axis toAxisOfView:(UIView *)view;
- (void)alignAxis:(NSLayoutAttribute)axis toAxisOfView:(UIView *)view constant:(CGFloat)constant;

- (void)alignToSuperviewLayoutAttribute:(NSLayoutAttribute)attribute
                             multiplier:(CGFloat)multiplier
                               constant:(CGFloat)constant;

- (NSLayoutConstraint *)addWidthConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)addHeightConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)addWidthAndHeightConstraints:(CGFloat)constant;

- (void)addEqualWidthsToView:(UIView *)view;
- (void)addEqualWidthsToView:(UIView *)view withOffset:(CGFloat)offset;
- (void)addEqualWidthsToView:(UIView *)view withMultiplier:(CGFloat)offset;
- (void)addEqualHeightsToView:(UIView *)view;
- (void)addEqualHeightsToView:(UIView *)view withMultiplier:(CGFloat)multiplier;

- (void)addSpacingWithAttribute:(NSLayoutAttribute)firstAttribute
                   betweenView:(UIView *)view
                 withAttribute:(NSLayoutAttribute)secondAttribute
                    multiplier:(CGFloat)multiplier
                      constant:(CGFloat)constant;

- (void)addSpacingWithAttribute:(NSLayoutAttribute)firstAttribute
                   betweenView:(UIView *)view
                 withAttribute:(NSLayoutAttribute)secondAttribute
                      constant:(CGFloat)constant;

- (void)addSpacingWithAttribute:(NSLayoutAttribute)firstAttribute
                   betweenView:(UIView *)view
                 withAttribute:(NSLayoutAttribute)secondAttribute;

- (NSLayoutConstraint *)addAttribute:(NSLayoutAttribute)attribute
        withRelation:(NSLayoutRelation)relation
           multiplier:(CGFloat)multiplier
            constant:(CGFloat)constant;

- (void)addAttribute:(NSLayoutAttribute)attribute
        withRelation:(NSLayoutRelation)relation
            constant:(CGFloat)constant;

- (void)addAttribute:(NSLayoutAttribute)attribute
        withRelation:(NSLayoutRelation)relation;

- (void)addRelation:(NSLayoutRelation)relation
             toView:(UIView *)view
      withAttribute:(NSLayoutAttribute)attribute
           constant:(CGFloat)constant;

- (void)addRelation:(NSLayoutRelation)relation
             toView:(UIView *)view
      withAttribute:(NSLayoutAttribute)attribute;

- (void)addAspectWidth:(CGFloat)widthMultiplier aspectHeight:(CGFloat)heightMultiplier;

@end
