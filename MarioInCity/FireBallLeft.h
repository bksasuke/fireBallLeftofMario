//
//  FireBallLeft.h
//  FlippingMario
//
//  Created by student on 10/19/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "Sprite.h"

@interface FireBallLeft : Sprite
@property (nonatomic, assign) CGFloat fireleft;
@property (nonatomic, weak) Sprite* fromSprite;

-(void) countballleft:(CGFloat) fireleft ;
    

@end

