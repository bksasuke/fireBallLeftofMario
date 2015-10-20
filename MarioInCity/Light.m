//
//  Light.m
//  AddLightLamp
//
//  Created by student on 10/18/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "Light.h"

@implementation Light
{
    UIImageView* lightView;
}
-(void) animate {
    self.view.center = CGPointMake(self.view.center.x + self.speedl, self.view.center.y);
    if (self.view.frame.origin.x + self.view.bounds.size.width < 0) {  //it passes left edge of screen
        self.view.center = CGPointMake(self.scene.size.width + self.view.bounds.size.width * 0.5, self.view.center.y);
    }
    [lightView startAnimating];
}
- (instancetype) initWithName:(NSString *)name
                      inScene:(Scene *)scene {
    
    self = [super initWithName:name
                       inScene:scene];
    lightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
    lightView.userInteractionEnabled = true;
    lightView.multipleTouchEnabled = true;
    lightView.animationImages = @[
                                  [UIImage imageNamed:@"light1.png"],
                                  [UIImage imageNamed:@"light2.png"],
                                  [UIImage imageNamed:@"light3.png"],
                                  [UIImage imageNamed:@"light4.png"],
                                  ];
    lightView.animationDuration = 3.0;
       self.view = lightView;
    return self;
}
@end
