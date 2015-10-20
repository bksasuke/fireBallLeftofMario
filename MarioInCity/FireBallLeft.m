//
//  FireBallLeft.m
//  FlippingMario
//
//  Created by student on 10/19/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "FireBallLeft.h"

@implementation FireBallLeft
- (instancetype) initWithName:(NSString *)name
                      inScene:(Scene *)scene {
    self = [super initWithName:name
                       ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fireleft.png"]]
                       inScene:scene];
    return self;
    
}
-(void)countballleft:(CGFloat)fireleft {
 
}

- (void) animate {
    
}
@end
