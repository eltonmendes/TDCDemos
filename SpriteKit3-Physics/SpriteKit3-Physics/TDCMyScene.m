//
//  TDCMyScene.m
//  SpriteKit3-Physics
//
//  Created by Elton Mendes Vieira Junior on 07/07/14.
//  Copyright (c) 2014 TDC. All rights reserved.
//

#import "TDCMyScene.h"

@implementation TDCMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.physicsWorld.gravity = CGVectorMake(0, -4.0f);
        [self addFloorAndBackground];
    }
    return self;
}

-(void)addFloorAndBackground
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    //background
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"backgroundsoccer.jpg"]];
    [background setScale:0.5f];
    background.position = CGPointMake(screenRect.size.width/2, screenRect.size.height/2);
    [self addChild:background];
    //floor
    SKSpriteNode *floor = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(320, 10)];
    floor.position = CGPointMake(screenRect.size.width/2, 0);
    floor.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
    floor.physicsBody.dynamic = NO;
    [self addChild:floor];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode * ballNode = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"ball"]];
        [ballNode setScale:0.05f];
        ballNode.position = location;
        ballNode.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ballNode.size.width/2];
        ballNode.physicsBody.restitution = 0.7f;
        [self addChild:ballNode];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
