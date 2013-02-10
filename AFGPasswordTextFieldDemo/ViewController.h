//
//  ViewController.h
//  AFGPasswordTextFieldDemo
//
//  Created by Daniel Beard on 8/02/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFGPasswordTextField.h"

@interface ViewController : UIViewController <AFGPasswordTextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet AFGPasswordTextField *passwordField;

//Display the field contents
- (IBAction)donePressed:(id)sender;

@end
