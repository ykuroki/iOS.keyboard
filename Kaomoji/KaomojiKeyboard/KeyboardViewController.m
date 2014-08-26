//
//  KeyboardViewController.m
//  KaomojiKeyboard
//
//  Created by Yuki Kuroki on 2014/08/26.
//  Copyright (c) 2014年 YUKI KUROKI. All rights reserved.
//

#import "KeyboardViewController.h"
#import "Keyboard.h"

@interface KeyboardViewController ()
//@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (strong,nonatomic) Keyboard *mykeyboard;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mykeyboard = [[[NSBundle mainBundle] loadNibNamed:@"Keyboard" owner:nil options:nil] objectAtIndex:0];
    [self addGesturesToKeyboard];
    
    [self.mykeyboard.tabScrollView setContentSize:CGSizeMake(640, 64)];
    
    
    self.inputView = self.mykeyboard;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    //[self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

#pragma mark Keyboards
-(void)addGesturesToKeyboard{
    [self.mykeyboard.deleteKey addTarget:self action:@selector(pressDeleteKey) forControlEvents:UIControlEventTouchUpInside];
    //キーボードきりかえ
    [self.mykeyboard.globeKey addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressDeleteKey {
    [self.textDocumentProxy deleteBackward];
}

@end
