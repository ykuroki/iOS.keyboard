//
//  KeyboardViewController.m
//  KaomojiKeyboard
//
//  Created by Yuki Kuroki on 2014/08/26.
//  Copyright (c) 2014年 YUKI KUROKI. All rights reserved.
//

#import "KeyboardViewController.h"
#import "Keyboard.h"
#import "Smile.h"
#import "Cry.h"
#import "Joy.h"
#import "Angry.h"
#import "Scream.h"
#import "Setting.h"

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
    
    //切り替え用のView追加
    Smile *subview = [[Smile alloc] init];
    [self.mykeyboard.changeView addSubview:subview];
    
    [self.mykeyboard.tabScrollView setContentSize:CGSizeMake(640, 40)];
    
    [self.mykeyboard.changeScrollView setContentSize:CGSizeMake(320,600)];

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
    //設定
    [self.mykeyboard.settingKey addTarget:self action:@selector(pressSettingKey) forControlEvents:UIControlEventTouchUpInside];
    //キーボードきりかえ
    [self.mykeyboard.globeKey addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];

    //各種表情
    [self.mykeyboard.smileKey addTarget:self action:@selector(pressSmileKey) forControlEvents:UIControlEventTouchUpInside];
    [self.mykeyboard.cryKey addTarget:self action:@selector(pressCryKey) forControlEvents:UIControlEventTouchUpInside];
    [self.mykeyboard.joyKey addTarget:self action:@selector(pressJoyKey) forControlEvents:UIControlEventTouchUpInside];
    [self.mykeyboard.angryKey addTarget:self action:@selector(pressAngryKey) forControlEvents:UIControlEventTouchUpInside];
    [self.mykeyboard.screamKey addTarget:self action:@selector(pressScreamKey) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressKey:(UIButton *)key {
    [self.textDocumentProxy insertText:[key currentTitle]];
}

-(void)pressDeleteKey {
    [self.textDocumentProxy deleteBackward];
}

-(void)pressSettingKey {
    Setting *settingView = [[Setting alloc] init];
    [self.mykeyboard.changeView addSubview:settingView];
}

/*
 * 各顔文字ベージボタン
 */
-(void)pressSmileKey {
    Smile *smileView = [[Smile alloc] init];

    for (UIButton *key in smileView.KeysArray) {
        [key addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
    }

    smileView.frame = CGRectMake(0, 0, 320, 600);
    self.mykeyboard.changeView.frame = CGRectMake(0, 0, 320, 600);
    [self.mykeyboard.changeView addSubview:smileView];
}

-(void)pressCryKey {
    Cry *cryView = [[Cry alloc]  init];

    for (UIButton *key in cryView.KeysArray) {
        [key addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
    }

    [self.mykeyboard.changeView addSubview:cryView];
}

-(void)pressJoyKey {
    Joy *joyView = [[Joy alloc] init];

    for (UIButton *key in joyView.KeysArray) {
        [key addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.mykeyboard.changeView addSubview:joyView];
}

-(void)pressAngryKey {
    Angry *angryView = [[Angry alloc] init];

    for (UIButton *key in angryView.KeysArray) {
        [key addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.mykeyboard.changeView addSubview:angryView];
}

-(void)pressScreamKey {
    Scream *screamView = [[Scream alloc] init];

    for (UIButton *key in screamView.KeysArray) {
        [key addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
    }

    [self.mykeyboard.changeView addSubview:screamView];
}

@end
