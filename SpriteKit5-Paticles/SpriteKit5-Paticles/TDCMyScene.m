//
//  TDCMyScene.m
//  SpriteKit5-Paticles
//
//  Created by Elton Mendes Vieira Junior on 13/07/14.
//  Copyright (c) 2014 TDC. All rights reserved.
//

#import "TDCMyScene.h"

@implementation TDCMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        CGRect rect = [UIScreen mainScreen].bounds;
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
        background.position = CGPointMake(rect.size.width/2, rect.size.height/2);
        [background setScale:0.3f];
        [self addChild:background];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKEmitterNode * fireParticle = [NSKeyedUnarchiver unarchiveObjectWithFile: [[NSBundle mainBundle] pathForResource:@"Fire" ofType:@"sks"]];
        fireParticle.position = location;
        [self addChild:fireParticle];
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
