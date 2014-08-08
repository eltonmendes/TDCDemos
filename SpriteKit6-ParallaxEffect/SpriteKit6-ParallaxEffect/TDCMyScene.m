//
//  TDCMyScene.m
//  SpriteKit6-ParallaxEffect
//
//  Created by Elton Mendes Vieira Junior on 16/07/14.
//  Copyright (c) 2014 TDC. All rights reserved.
//


#import "TDCMyScene.h"


@interface TDCMyScene ()

@property (nonatomic,strong) NSMutableArray *parallaxNode1;
@property (nonatomic,strong) NSMutableArray *parallaxNode2;
@property (nonatomic,strong) SKSpriteNode *sun;
@end

@implementation TDCMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        

        
        SKSpriteNode *background =[SKSpriteNode spriteNodeWithImageNamed:@"background"];
        
        [background setPosition:CGPointMake(150, 240)];
        [background setScale:0.7];
        [self addChild:background];

        [self addSun];
        [self addParallax];
        
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
        
        SKAction *scoreFlyAnimation = [SKAction animateWithTextures:birdScoreTextures timePerFrame:0.1];
        
        SKSpriteNode *bird = [SKSpriteNode spriteNodeWithImageNamed:@"Bird_sore00"];
        [bird runAction:[SKAction repeatActionForever:scoreFlyAnimation]];
        [bird setScale:0.3f];
        bird.position = CGPointMake(50, 200);
        [self addChild:bird];
        
    }
    return self;
}
- (void)addSun
{
    self.sun =[SKSpriteNode spriteNodeWithImageNamed:@"sun"];
    [self.sun setScale:0.7f];
    self.sun.position = CGPointMake(0, 320);
    [self addChild:self.sun];

}

- (void)addParallax
{
    
    self.parallaxNode1 = [NSMutableArray new];
    self.parallaxNode2 = [NSMutableArray new];
    
    for(int i = 0 ; i <10 ; i ++){
        SKSpriteNode *tree =[SKSpriteNode spriteNodeWithImageNamed:@"tree"];
        
        [tree setPosition:CGPointMake(320 + (i * 300), 160)];
        [tree setScale:0.7];
        [self.parallaxNode1 addObject:tree];
        [self addChild:tree];
        
        SKSpriteNode *cloud =[SKSpriteNode spriteNodeWithImageNamed:@"cloud"];
        
        [cloud setPosition:CGPointMake(320 + (i * 250), 260)];
        [cloud setScale:0.7];
        [self.parallaxNode2 addObject:cloud];
        [self addChild:cloud];
    }
}

#pragma mark - Update scene handler

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */

    for(SKSpriteNode *cloud in self.parallaxNode2){
        cloud.position = CGPointMake(cloud.position.x - 0.5f, cloud.position.y);
    }
    
    for(SKSpriteNode *tree in self.parallaxNode1){
        tree.position = CGPointMake(tree.position.x - 2, tree.position.y);
    }
    
    self.sun.position = CGPointMake(self.sun.position.x + 0.25f, self.sun.position.y - 0.1f);
}

@end
