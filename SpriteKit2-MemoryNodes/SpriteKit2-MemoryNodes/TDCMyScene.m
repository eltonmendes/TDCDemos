//
//  TDCMyScene.m
//  SpriteKit2-MemoryNodes
//
//  Created by Elton Mendes Vieira Junior on 06/07/14.
//  Copyright (c) 2014 TDC. All rights reserved.
//

#import "TDCMyScene.h"

@interface TDCMyScene ()
@property (nonatomic,strong) NSArray *preloadTextures;
@end

@implementation TDCMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        CGRect screenRect = [UIScreen mainScreen].bounds;
        
        self.preloadTextures = @[[SKTexture textureWithImageNamed:@"background"]];
        
        [SKTexture preloadTextures:self.preloadTextures withCompletionHandler:^{
            SKTexture *texture = self.preloadTextures[0];
            SKSpriteNode * backgroundNode = [SKSpriteNode spriteNodeWithTexture:texture];
            backgroundNode.position = CGPointMake(screenRect.size.width/2,screenRect.size.height/2);
            [backgroundNode setScale:0.8f];
            [self addChild:backgroundNode];
        }];
        
        [self runAction:[SKAction playSoundFileNamed:@"streetmusic.mp3" waitForCompletion:NO] completion:^{
           
        }];

    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"ryu"];
        
        sprite.position = location;
        [sprite setScale:0.3f];
        SKAction *action = [SKAction moveTo:CGPointMake(location.x + 420,location.y) duration:3.0f];
        
        
        
        [sprite runAction:[SKAction repeatActionForever:action] completion:^{
            [sprite removeFromParent];
        }];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
