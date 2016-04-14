//
//  DataViewController.m
//  WalkThroughPages
//
//  Created by sidawang on 4/13/16.
//  Copyright © 2016 sidex. All rights reserved.
//

#import "DataViewController.h"
#import "ModelController.h"
#import "AppDelegate.h"
@interface DataViewController ()
- (IBAction)jumpAction:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.heightConstraint.constant = 50;
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleLabel.text = [(PageData*)self.dataObject pageTitle];
    self.explanationLabel.text = [(PageData*)self.dataObject pageExplanation];
    self.imageView.image = [UIImage imageNamed:[(PageData*)self.dataObject imageName]];
    if([(PageData*)self.dataObject isLastPage]){
        self.jumpBtn.layer.cornerRadius = 4;
        self.jumpBtn.clipsToBounds = YES;
        self.jumpBtn.hidden = NO;
    }else{
        self.jumpBtn.hidden = YES;
    }
    
  
    [UIView animateWithDuration:2 animations:^{
        self.heightConstraint.constant = 250;
        [self.view layoutIfNeeded];
    } completion:nil];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.heightConstraint.constant = 50;
    [self.view layoutIfNeeded];
}
- (IBAction)jumpAction:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"first_loading"];
    [(AppDelegate*)([[UIApplication sharedApplication] delegate]) launchViewController];
}
@end
