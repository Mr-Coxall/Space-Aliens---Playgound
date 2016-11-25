//: # Space Alien Introduction
//: In this Swift Playground you will be introduced to SpriteKit. SpriteKit is a framework from Apple to help with the development of 2D games. You will need to be familiar with the Swift programming language to complete this playground. If you have not complete the "Learn to Code 1" playground, stop here and go and finish that first. 
//: 
//: Now that you have finished "Learn to Code 1" or you are already a Swift programmer, lets start by playing the game that you will be making. Drag the live view window button on the right hand side of the screen, so that you have a full screen view to -lay the game in. Then press run and enjoy the game.
//: ![Single View Application](single_view.png)



//: [Previous](@previous)  ||  [Next Topic](@next)


//#-hidden-code
// Created on: Nov-2016
// Created by: Mr. Coxall
// Created for: ICS3U
// This program is a Space Alien game, kind of like Space Invaders

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class GameScene: SKScene {
    // local variables to this scene
    let player = SKSpriteNode(imageNamed: "spaceShip.png")
    let leftButton = SKSpriteNode(imageNamed: "leftButton.png")
    let rightButton = SKSpriteNode(imageNamed: "rightButton.png")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        let backgroundImage = SKSpriteNode(imageNamed: "star_background.png")
        backgroundImage.name = "background image"
        backgroundImage.position = CGPoint(x: 0, y: 0)
        backgroundImage.size = CGSize(width: size.width, height: size.height)
        self.addChild(backgroundImage)
        
        player.position = CGPoint(x: (size.width / 2), y: 50)
        player.name = "space ship"
        self.addChild(player)
        
        leftButton.name = "left button"
        leftButton.position = CGPoint(x: 100, y: 100)
        leftButton.alpha = 0.5
        self.addChild(leftButton)
        
        rightButton.name = "right button"
        rightButton.position = CGPoint(x: 300, y: 100)
        //leftButton.size = CGSize(width: size.width, height: size.height)
        self.addChild(rightButton)
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch = touches as!  Set<UITouch>
        var location = touch.first!.location(in: self)
        var node = self.atPoint(location)
        
        // If next is touched
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch = touches as!  Set<UITouch>
        var location = touch.first!.location(in: self)
        var node = self.atPoint(location)
        
        if (node.name == "right button") {
            player.position.x = player.position.x + 1
        }
        
        if (node.name == "left button") {
            player.position.x = player.position.x - 1
        }
        
    }
}
//#-end-hidden-code