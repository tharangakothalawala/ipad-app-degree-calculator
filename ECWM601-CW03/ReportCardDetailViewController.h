//
//  ReportCardDetailViewController.h
//  ECWM601-CW03
//
//  Created by Rasanga Pathirage Perera on 14/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportCardDetailViewController : UIViewController <UISplitViewControllerDelegate, UITabBarDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *levelFourView;
@property (weak, nonatomic) IBOutlet UIView *levelFiveView;
@property (weak, nonatomic) IBOutlet UIView *levelSixView;
@property (weak, nonatomic) IBOutlet UIView *summaryView;

@property (weak, nonatomic) IBOutlet UITabBarItem *levelFourBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *levelFiveBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *levelSIxBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *datesBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *summaryBarItem;
@property (strong, nonatomic) IBOutletCollection(UITabBarItem) NSArray *levelFourBarItemCollection;
@property (weak, nonatomic) IBOutlet UITabBar *courseTabBar;

//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;


@end
