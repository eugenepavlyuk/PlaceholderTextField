//
//  PlaceholderTextField.h
//  TopMeUp
//
//  Created by Igor Nikolaev on 12/28/13.
//  Copyright (c) 2013 Documatic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextField : UITextField
{
    UILabel *_placeholderLabel;
}

@property (nonatomic, copy) NSString *placeholderText;
@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, strong) UIColor *placeholderColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIFont *placeholderFont UI_APPEARANCE_SELECTOR;

@end
