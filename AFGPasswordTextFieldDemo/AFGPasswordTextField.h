//
//  AFGPasswordTextField.h
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
 
#import <UIKit/UIKit.h>

@protocol AFGPasswordTextFieldDelegate <UITextFieldDelegate>

@end

/**
 This class is a custom UITextField designed for password / PIN entry 
 That allows a custom unicode character in place of the normal dot
 
 Instead of using the normal delegate object as you would for a UITextField, use the afgPasswordDelegate
 Instead of using the text property, use the passwordText property.
 */
@interface AFGPasswordTextField : UITextField

@property (nonatomic, weak) id<AFGPasswordTextFieldDelegate> afgPasswordDelegate;

/** This property returns the actual string, and must be used in place of the text property */
@property (nonatomic,strong) NSString *passwordText;

@property (nonatomic,copy) NSString *maskCharacter;

@end


