//
//  Scene.h
//  MarioInCity
//
//  Created by Cuong Trinh on 7/27/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sprite.h"

@class Sprite; //Forward class declaration

@interface Scene : UIViewController
@property(nonatomic, strong) NSMutableDictionary *sprites;
@property(nonatomic, assign) CGSize size;

- (void) addSprite: (Sprite*) sprite;

- (void) removeSprite: (Sprite*) sprite;

- (void) removeSpriteByName: (NSString*) spriteName;
@end
