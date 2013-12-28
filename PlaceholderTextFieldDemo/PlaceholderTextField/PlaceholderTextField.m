//
//  PlaceholderTextField.m
//  TopMeUp
//
//  Created by Igor Nikolaev on 12/28/13.
//  Copyright (c) 2013 Documatic. All rights reserved.
//

#import "PlaceholderTextField.h"

@interface PlaceholderTextField()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end


@implementation PlaceholderTextField

+ (void)initialize
{
    PlaceholderTextField *placeholderTextField = [PlaceholderTextField appearance];
    placeholderTextField.placeholderColor = [UIColor redColor];
    placeholderTextField.placeholderFont = [UIFont fontWithName:@"Helvetica-Light" size:18];
}

- (void)didMoveToWindow
{
    _placeholderLabel.font = self.placeholderFont;
    _placeholderLabel.textColor = self.placeholderColor;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self addSubview:self.placeholderLabel];
    
    self.placeholderLabel.hidden = ([self.text length]);
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        _insets = UIEdgeInsetsMake(0, 10, 0, 10);
        _placeholderText = [self.placeholder copy];
        self.placeholder = @"";
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textFieldDidChange:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:self];
    }
    
    return self;
}

- (void)textFieldDidChange:(NSNotification*)notification
{
    _placeholderLabel.hidden = [self.text length];
}

- (UILabel*)placeholderLabel
{
    if (!_placeholderLabel)
    {
        _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, _insets.left, _insets.top)];
        _placeholderLabel.userInteractionEnabled = NO;
        _placeholderLabel.textAlignment = self.textAlignment;
        _placeholderLabel.text = self.placeholderText;
        _placeholderLabel.backgroundColor = [UIColor clearColor];
    }
    
    return _placeholderLabel;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeholderLabel.frame = CGRectInset(self.bounds, _insets.left, _insets.top);
}

- (void)setInsets:(UIEdgeInsets)insets
{
    _insets = insets;
    
    [self setNeedsLayout];
}

- (void)setText:(NSString *)theText
{
    _placeholderLabel.hidden = [theText length];
    
    [super setText:theText];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    if (_placeholderLabel)
    {
        self.placeholderText = placeholder;
        _placeholderLabel.text = self.placeholderText;
    }
    else
    {
        [super setPlaceholder:placeholder];
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = _placeholderColor;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    _placeholderFont = placeholderFont;
    
    self.placeholderLabel.font = _placeholderFont;
}

@end
