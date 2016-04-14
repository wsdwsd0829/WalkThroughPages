//
//  ModelController.h
//  WalkThroughPages
//
//  Created by sidawang on 4/13/16.
//  Copyright © 2016 sidex. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PageData : NSObject
@property NSString* pageTitle;
@property NSString* imageName;
@property NSString* pageExplanation;
@property BOOL isLastPage;
@end


@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

