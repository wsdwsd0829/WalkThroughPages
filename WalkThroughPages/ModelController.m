//
//  ModelController.m
//  WalkThroughPages
//
//  Created by sidawang on 4/13/16.
//  Copyright © 2016 sidex. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


@implementation PageData
-(instancetype) initWitTitle:(NSString*)title withImageName:(NSString*)imageName withExplanation:(NSString*)explanation{
    self = [super init];
    if(self){
        self.pageTitle = title;
        self.imageName = imageName;
        self.pageExplanation = explanation;
        self.isLastPage = NO;
    }
    return self;
}
    

+(NSArray*)defaultPageData{
    NSMutableArray* pages = [[NSMutableArray alloc] init];
    PageData* abstractPage = [[PageData alloc] initWitTitle:@"First Title" withImageName:@"Page.png" withExplanation:@"\"Abstracts\": explain your pages here"];
    PageData* abstractListPage = [[PageData alloc] initWitTitle:@"Review Abstractions" withImageName:@"Page.png" withExplanation:@"explain your pages here"];
    PageData* evernnotePage = [[PageData alloc] initWitTitle:@"Browse notes" withImageName:@"Page.png" withExplanation:@"explain your pages here"];
    PageData* settingPage = [[PageData alloc] initWitTitle:@"Pereferences" withImageName:@"settingPage.png" withExplanation:@"explain your pages here"];
    settingPage.isLastPage = YES;
    pages = [NSMutableArray arrayWithArray:@[abstractPage, abstractListPage, evernnotePage,settingPage]];
    return pages;
}
@end


@interface ModelController ()

@property (readonly, strong, nonatomic) NSArray *pageData;
@property (readonly, strong, nonatomic) NSArray *allPageData;
@end

@implementation ModelController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Create the data model.
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        _pageData = [[dateFormatter monthSymbols] copy];
        _allPageData = [PageData defaultPageData];
        
    }
    return self;
}


- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    if (([self.allPageData count] == 0) || (index >= [self.allPageData count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = self.allPageData[index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.allPageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.allPageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
