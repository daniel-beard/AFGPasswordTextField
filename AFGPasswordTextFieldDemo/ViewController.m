//
//  ViewController.m
//  AFGPasswordTextFieldDemo
//
//  Created by Daniel Beard on 8/02/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set the password field delegate to self
    self.passwordField.afgPasswordDelegate = self;
    
    // Set a custom mask character
    //self.passwordField.maskCharacter = @"%";
    
    self.passwordField.textColor = [UIColor colorWithRed:255.0f / 255.0f green:162.0f / 255.0f blue:0.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPasswordField:nil];
    [self setUsernameField:nil];
    [super viewDidUnload];
}

- (IBAction)donePressed:(id)sender {
    
    NSString *message = [NSString stringWithFormat:@"Username: %@ \nPassword: %@", self.usernameField.text, self.passwordField.passwordText];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Contents" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

//AFGPasswordTextField Delegate Method
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    //hide the keyboard
    [self.passwordField resignFirstResponder];
    return YES;
}

@end
