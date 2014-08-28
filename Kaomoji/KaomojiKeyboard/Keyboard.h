//
//  Keyboard.h
//  Kaomoji
//
//  Created by Yuki Kuroki on 2014/08/26.
//  Copyright (c) 2014年 YUKI KUROKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Keyboard : UIView

@property (weak, nonatomic) IBOutlet UIButton *deleteKey;
@property (weak, nonatomic) IBOutlet UIButton *globeKey;
@property (weak, nonatomic) IBOutlet UIButton *smileKey;
@property (weak, nonatomic) IBOutlet UIButton *cryKey;
@property (weak, nonatomic) IBOutlet UIButton *joyKey;
@property (weak, nonatomic) IBOutlet UIButton *angryKey;
@property (weak, nonatomic) IBOutlet UIButton *screamKey;
@property (weak, nonatomic) IBOutlet UIButton *settingKey;




@property (weak, nonatomic) IBOutlet UIScrollView *changeScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *tabScrollView;
@property (weak, nonatomic) IBOutlet UIView *changeView;

@end
