//
//  SuperMario.m
//  MarioInCity
//
//  Created by Cuong Trinh on 7/30/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//
#import "SuperMario.h"
#import "FireBall.h"
@implementation SuperMario
{
    BOOL isRunning, isJumping, isFlipping;
    CGFloat jumpVelocity, fallAcceleration, flipVelocity,ballleft;
    int fireBallCount, fireballleft;
    UIImageView* marioView;
   
}

- (instancetype) initWithName: (NSString*) name
                      inScene: (Scene*) scene {
    self = [super initWithName:name
                       inScene:scene];
    marioView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 102)];
    marioView.userInteractionEnabled = true;
    marioView.multipleTouchEnabled = false;
    marioView.animationImages = @[
                                  [UIImage imageNamed:@"1.png"],
                                  [UIImage imageNamed:@"2.png"],
                                  [UIImage imageNamed:@"3.png"],
                                  [UIImage imageNamed:@"4.png"],
                                  [UIImage imageNamed:@"5.png"],
                                  [UIImage imageNamed:@"6.png"],
                                  [UIImage imageNamed:@"7.png"],
                                  [UIImage imageNamed:@"8.png"]
                                  ];
    marioView.animationDuration = 1.0;
    [marioView startAnimating];
    self.view = marioView;
    fireBallCount = 0;
    [self applyGestureRecognizer];
    self.alive = true;
    return self;
    
}
- (void) applyGestureRecognizer {
        UITapGestureRecognizer *single_tap_recognizer,*double_tap_recognizer;
    single_tap_recognizer = [[UITapGestureRecognizer alloc] initWithTarget : self
                                                                      action: @selector(startJump)];
    [single_tap_recognizer setNumberOfTapsRequired : 1];
    
    
    double_tap_recognizer = [[UITapGestureRecognizer alloc] initWithTarget : self
                                                                     action:@selector(startFlipback)];
    [double_tap_recognizer setNumberOfTapsRequired:2];
    [self.scene.view addGestureRecognizer :single_tap_recognizer];
    [self.scene.view addGestureRecognizer :double_tap_recognizer];
    [single_tap_recognizer requireGestureRecognizerToFail:double_tap_recognizer];
    
}
- (void) startJump { NSLog(@"gui tin hieu vao ham jump");
    if (!isJumping) {
        isJumping = true;
        jumpVelocity = - 40.0;
        fallAcceleration = 10.0;
    }
}
- (void) jump {
    if (!isJumping) return;
    CGFloat y = self.view.center.y;
    y += jumpVelocity;
    jumpVelocity += fallAcceleration;
    if (y > self.y0) {
        NSLog(@"Jump nao mario");
        y = self.y0;
        isJumping = false;
    }
    self.view.center = CGPointMake(self.view.center.x, y);
    
}

-(void) startFlipback {
    NSLog(@"gui tin hieu vao ham flipback");
    if (!isFlipping) {
        isFlipping = true;
       flipVelocity =  -40.0;
        fallAcceleration = 10.0;
    }
    
}
-(void) flipback {
 
    if (!isFlipping) return;
    CGFloat y = self.view.center.y;
    y += flipVelocity;
    flipVelocity += fallAcceleration;

    [UIView animateWithDuration:.1
                          delay:.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [marioView setTransform:CGAffineTransformRotate(marioView.transform, M_PI)];
                     }completion:^(BOOL finished){
                         
                     }];

    if (y > self.y0) {
        y = self.y0 ;
        isFlipping = false;
    }
    
self.view.center = CGPointMake(self.view.center.x,y );
   }

- (void) animate {
    if (!self.alive) return;
   [self jump];
    [self flipback];
}
@end
