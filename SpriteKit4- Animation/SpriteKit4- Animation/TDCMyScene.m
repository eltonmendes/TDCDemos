//
//  TDCMyScene.m
//  SpriteKit4- Animation
//
//  Created by Elton Mendes Vieira Junior on 08/07/14.
//  Copyright (c) 2014 TDC. All rights reserved.
//

#import "TDCMyScene.h"

@implementation TDCMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *background =[SKSpriteNode spriteNodeWithImageNamed:@"background"];
        
        [background setPosition:CGPointMake(150, 240)];
        [background setScale:0.7];
        [self addChild:background];
        
        SKTexture *h0 = [SKTexture  textureWithImageNamed:@"Bird_sore00"];
        SKTexture *h1 = [SKTexture  textureWithImageNamed:@"Bird_sore01"];
        SKTexture *h2 = [SKTexture  textureWithImageNamed:@"Bird_sore02"];
        SKTexture *h3 = [SKTexture  textureWithImageNamed:@"Bird_sore03"];
        SKTexture *h4 = [SKTexture  textureWithImageNamed:@"Bird_sore04"];
        SKTexture *h5 = [SKTexture  textureWithImageNamed:@"Bird_sore05"];
        SKTexture *h6 = [SKTexture  textureWithImageNamed:@"Bird_sore06"];
        SKTexture *h7 = [SKTexture  textureWithImageNamed:@"Bird_sore07"];
        SKTexture *h8 = [SKTexture  textureWithImageNamed:@"Bird_sore08"];
        SKTexture *h9 = [SKTexture  textureWithImageNamed:@"Bird_sore09"];
        SKTexture *h10 = [SKTexture  textureWithImageNamed:@"Bird_sore10"];
        SKTexture *h11 = [SKTexture  textureWithImageNamed:@"Bird_sore11"];
        
        NSArray *birdScoreTextures = @[h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11];
        
        SKAction *scoreFlyAnimation = [SKAction animateWithTextures:birdScoreTextures timePerFrame:0.3];
        
        SKSpriteNode *bird = [SKSpriteNode spriteNodeWithImageNamed:@"Bird_sore00"];
        [bird runAction:[SKAction repeatActionForever:scoreFlyAnimation]];
        [bird setScale:0.3f];
        bird.position = CGPointMake(50, 200);
        [self addChild:bird];



        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
