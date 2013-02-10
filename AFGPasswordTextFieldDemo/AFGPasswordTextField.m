//
//  AFGPasswordTextField.m
//  SalesTools
//
//  Created by Daniel Beard on 17/12/12.
//  Copyright (c) 2012 Daniel Beard. All rights reserved.
//

/*
 Copyright (C) 2013 Daniel Beard
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "AFGPasswordTextField.h"

@class AFGInternalPasswordTextFieldDelegate;
@interface AFGInternalPasswordTextFieldDelegate : NSObject <UITextFieldDelegate>
@property (nonatomic, weak) AFGPasswordTextField *textField;
@end

@interface AFGPasswordTextField()
@property (nonatomic, strong) AFGInternalPasswordTextFieldDelegate *customDelegate;
@end

@implementation AFGPasswordTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

//Common Init Method
-(void) commonInit {
   
    //Set up custom delegate (we can't be our own delegate)
    self.customDelegate = [[AFGInternalPasswordTextFieldDelegate alloc] init];
    self.customDelegate.textField = self; 
    self.delegate = self.customDelegate;
    
    //set the default mask character
    self.maskCharacter = @"\u2055";
    
    //alloc the password text.
    self.passwordText = [NSString string];
}

@end

@implementation AFGInternalPasswordTextFieldDelegate

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
   
    if (self.textField.afgPasswordDelegate && [self.textField.afgPasswordDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)])
        return [self.textField.afgPasswordDelegate textFieldShouldBeginEditing:textField];
    return YES;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    if (self.textField.afgPasswordDelegate && [self.textField.afgPasswordDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)])
        [self.textField.afgPasswordDelegate textFieldDidBeginEditing:textField];
}

-(BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    if (self.textField.afgPasswordDelegate && [self.textField.afgPasswordDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)])
        return [self.textField.afgPasswordDelegate textFieldShouldEndEditing:textField];
    return YES;
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
    if (self.textField.afgPasswordDelegate && [self.textField.afgPasswordDelegate respondsToSelector:@selector(textFieldDidEndEditing:)])
        [self.textField.afgPasswordDelegate textFieldDidEndEditing:textField];
}

//UITextField Delegate
-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
   
    /*
    NSCharacterSet *unacceptedInput = [[NSCharacterSet alphanumericCharacterSet]invertedSet];
    if ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] >1){
        return NO;
    }
     */
    
    //update the underlying password text
    self.textField.passwordText = [self.textField.passwordText stringByReplacingCharactersInRange:range withString:string];
    
    //Update the visible text by replacing with the chosen unicode character
    NSUInteger textCount = self.textField.passwordText.length;
    textField.text = @"";
    textField.text = [@"" stringByPaddingToLength:textCount withString:self.textField.maskCharacter startingAtIndex:0];
    
    //don't change the text after we have changed it.
    return NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //call the delegate
    if (self.textField.afgPasswordDelegate && [self.textField.afgPasswordDelegate respondsToSelector:@selector(textFieldShouldReturn:)])
        return [self.textField.afgPasswordDelegate textFieldShouldReturn:textField];
    
    //return YES by default
    return YES;
}

-(BOOL) textFieldShouldClear:(UITextField *)textField {
    
    //call the delegate
    if (self.textField.afgPasswordDelegate && [self.textField.afgPasswordDelegate respondsToSelector:@selector(textFieldShouldClear:)])
        return [self.textField.afgPasswordDelegate textFieldShouldClear:textField];
    
    //return YES by default
    return YES;
}


@end
