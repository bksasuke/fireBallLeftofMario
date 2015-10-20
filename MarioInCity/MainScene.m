//
//  MainScene.m
//  MarioInCity
//
//  Created by Cuong Trinh on 7/27/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//
#import "Light.h"
#import "FireBall.h"
#import "FireBallLeft.h"
#import "MainScene.h"
#import "Sprite.h"
#import "City.h"
#import "Cloud.h"
#import "Block.h"
#import "SuperMario.h"
#define city_background_width 1498

@implementation MainScene
{
    SuperMario *mario;
    City *city1, *city2;
    CGSize citySize;
    NSTimer *timer;
    Cloud *cloud1, *cloud2, *cloud3;
    Light *light1, *light2, *light3;
    CGFloat marioRunSpeed;
    FireBallLeft *ball1,*ball2,*ball3,*ball4,*ball5,*ball6,*ball7;
    int i,fireBallCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    self.size = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - statusNavigationBarHeight);
    i=0, fireBallCount=0;
    [self addCity];
    [self addClouds];
    [self addSuperMario];
    [self fireball];
    [self addFireleft];
    [self addLights];
           marioRunSpeed = 20.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(gameloop)
                                           userInfo:nil
                                            repeats:true];
}
-(void)addLights {
    light1 = [[Light alloc]initWithName:@"light1"
                                inScene:self];
    light1.speedl = -10;
    light1.view.center = CGPointMake(20,300 );
    light2 = [[Light alloc]initWithName:@"light2"
                                inScene:self];
    light2.speedl = -10;
    light2.view.center = CGPointMake(550,300 );
    
    light3 = [[Light alloc]initWithName:@"light3"
                                inScene:self];
    light3.speedl = -10;
    light3.view.center = CGPointMake(250,300 );
    [self addSprite:light1];
    [self addSprite:light2];
    [self addSprite:light3];
    
}


-(void) fireball {
    UISwipeGestureRecognizer* swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(addFireAndRemoveMushroom)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeLeft];
    
}
-(void)addFireAndRemoveMushroom {
    fireBallCount ++;
    FireBall *fireBall = [[FireBall alloc] initWithName:[NSString stringWithFormat:@"fireball%d", fireBallCount]
                                                inScene:self];
    fireBall.view.center = CGPointMake(self.view.center.x + 5, self.view.center.y+100);
    [self addSprite:fireBall];
    [fireBall startFly:20];
    i++;
    if (i==1) {
        [self removeSprite:ball1]; //Xoa mushroom goc phai man hinh
    }
    if (i==2) {
        [self removeSprite:ball2];
    }
    if (i==3) {
        [self removeSprite:ball3];
    }
    if (i==4) {
        [self removeSprite:ball4];
    }
    if (i==5) {
        [self removeSprite:ball5];
    }
    if (i==6) {
        [self removeSprite:ball6];
    }
    if (i==7) {
        [self removeSprite:ball7];
    }
    
    }



- (void) addSuperMario {
    mario = [[SuperMario alloc] initWithName:@"mario"
                                     inScene:self];
    mario.y0 = self.size.height - mario.view.bounds.size.height * 0.5 - 10;
    mario.view.center = CGPointMake(self.size.width * 0.5-50, mario.y0);
    [self addSprite:mario];
}
- (void) addCity {
    citySize = CGSizeMake(city_background_width, 400);
    UIImage* cityBackground = [UIImage imageNamed:@"city"];
    city1 = [[City alloc] initWithName:@"city1"
                               ownView:[[UIImageView alloc] initWithImage:cityBackground]
                               inScene:self];
    city1.view.frame = CGRectMake(0, self.size.height - citySize.height, citySize.width, citySize.height);
    
    city2 = [[City alloc] initWithName:@"city2"
                               ownView:[[UIImageView alloc] initWithImage:cityBackground]
                               inScene:self];
    
    city2.view.frame = CGRectMake(citySize.width, self.size.height - citySize.height, citySize.width, citySize.height);
    
    [self.view addSubview:city1.view];
    [self.view addSubview:city2.view];
    
}
- (void) addClouds {
    cloud1 = [[Cloud alloc] initWithName:@"cloud1"
                                 ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud1.png"]]
                                 inScene:self];
    cloud1.speed = - 10.0;
    
    cloud2 = [[Cloud alloc] initWithName:@"cloud2"
                                 ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud2.png"]]
                                 inScene:self];
    cloud2.speed = - 5.0;
    
    cloud3 = [[Cloud alloc] initWithName:@"cloud3"
                                 ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud3.png"]]
                                 inScene:self];
    cloud3.speed = - 8.0;
    
    cloud1.view.frame = CGRectMake(20, 15, 100, 100);
    cloud2.view.frame = CGRectMake(150, 3, 80, 80);
    cloud3.view.frame = CGRectMake(260, 7, 90, 90);
    
    [self addSprite:cloud1];
    [self addSprite:cloud2];
    [self addSprite:cloud3];
    
    
}

-(void) addFireleft {
    
    ball1 = [[FireBallLeft alloc]initWithName:@"ball1"
                                      inScene:self];
    ball1.view.frame = CGRectMake(self.size.width-30, 15,16,16);
    [self addSprite:ball1];
    ball2 = [[FireBallLeft alloc]initWithName:@"ball2"
                                      inScene:self];
    ball2.view.frame = CGRectMake(self.size.width-45, 15,16,16);
    [self addSprite:ball2];
    ball3 = [[FireBallLeft alloc]initWithName:@"ball3"
                                      inScene:self];
    ball3.view.frame = CGRectMake(self.size.width-60, 15,16,16);
    [self addSprite:ball3];
    ball4 = [[FireBallLeft alloc]initWithName:@"ball4"
                                      inScene:self];
    ball4.view.frame = CGRectMake(self.size.width-75, 15,16,16);
    [self addSprite:ball4];
    ball5 = [[FireBallLeft alloc]initWithName:@"ball5"
                                      inScene:self];
    ball5.view.frame = CGRectMake(self.size.width-90, 15,16,16);
    [self addSprite:ball5];
    ball6 = [[FireBallLeft alloc]initWithName:@"ball6"
                                      inScene:self];
    ball6.view.frame = CGRectMake(self.size.width-105, 15,16,16);
    [self addSprite:ball6];
    ball7 = [[FireBallLeft alloc]initWithName:@"ball7"
                                      inScene:self];
    ball7.view.frame = CGRectMake(self.size.width-120, 15,16,16);
    [self addSprite:ball7];
    
    }



- (void) gameloop {
    ///
    [self moveCityBackAtSpeed:marioRunSpeed];
    for (Sprite *sprite in self.sprites.allValues) {
        [sprite animate];
    }
}
- (void) moveCityBackAtSpeed: (CGFloat) speed {
    city1.view.center = CGPointMake(city1.view.center.x - speed, city1.view.center.y);
    city2.view.center = CGPointMake(city2.view.center.x - speed, city1.view.center.y);
    if (city1.view.frame.origin.x + citySize.width < 0.0) {
        city1.view.frame = CGRectMake(city2.view.frame.origin.x + citySize.width,
                                      city1.view.frame.origin.y,
                                      citySize.width,
                                      citySize.height);
        
    }
    if (city2.view.frame.origin.x + citySize.width < 0.0) {
        city2.view.frame = CGRectMake(city1.view.frame.origin.x + citySize.width,
                                      city2.view.frame.origin.y,
                                      citySize.width,
                                      citySize.height);
    }
}

@end
