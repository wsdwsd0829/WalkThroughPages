//
//  DataViewController.h
//  WalkThroughPages
//
//  Created by sidawang on 4/13/16.
//  Copyright © 2016 sidex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel* explanationLabel;
@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@end

