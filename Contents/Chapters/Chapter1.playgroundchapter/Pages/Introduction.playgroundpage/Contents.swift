//: # Introduction
//: In this Swift Playground you will be introduced to SpriteKit. [SpriteKit is a framework from Apple](https://developer.apple.com/spritekit/) to help with the development of 2D games. You will need to be familiar with the [Swift programming language](https://developer.apple.com/swift/) to complete this playground. If you have not complete the "Learn to Code 1" playground, stop here and go and finish that first. 
//: 
//: ![Stop sign](stopSign.jpg)
//:
//: Now that you have finished "Learn to Code 1" or you are already a Swift programmer, lets start by playing the game that you will be making. Drag the live view window button on the right hand side of the screen, so that you have a full screen view to play the game in. Then press run and enjoy the game.

//: ![Space Aliens screenshot](spaceAlienGameScreenshot.jpg)

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
    let ship = SKSpriteNode(imageNamed: "spaceShip.png")
    let leftButton = SKSpriteNode(imageNamed: "leftButton.png")
    let rightButton = SKSpriteNode(imageNamed: "rightButton.png")
    let fireButton = SKSpriteNode(imageNamed: "redButton.png")
    var leftButtonPressed = false
    var rightButtonPressed = false
    var missiles = [SKSpriteNode]()
    var aliens = [SKSpriteNode]()
    var alienAttackRate = 1
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        let backgroundImage = SKSpriteNode(imageNamed: "star_background.png")
        backgroundImage.name = "background image"
        backgroundImage.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        backgroundImage.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(backgroundImage)
        
        ship.position = CGPoint(x: (size.width / 2), y: 100)
        ship.name = "space ship"
        self.addChild(ship)
        ship.setScale(0.65)
        
        leftButton.name = "left button"
        leftButton.position = CGPoint(x: 100, y: 100)
        leftButton.alpha = 0.5
        self.addChild(leftButton)
        leftButton.setScale(0.75)
        
        rightButton.name = "right button"
        rightButton.position = CGPoint(x: 300, y: 100)
        rightButton.alpha = 0.5
        self.addChild(rightButton)
        rightButton.setScale(0.75)
        
        fireButton.name = "fire button"
        fireButton.position = CGPoint(x: frame.size.width-100, y: 100)
        fireButton.alpha = 0.5
        self.addChild(fireButton)
        fireButton.setScale(0.75)
    }
    
    override func update(_ currentTime: TimeInterval) {
        //
        
        if rightButtonPressed == true {
            // move ship to right
            //var moveShipRight = SKAction.moveBy(x: 5, y: 0, duration: 0.1)
            //ship.run(moveShipRight)
            ship.position.x = ship.position.x + 10
        }
        else if leftButtonPressed == true {
            // move ship to left
            //var moveShipLeft = SKAction.moveBy(x: -5, y: 0, duration: 0.1)
            //ship.run(moveShipLeft)
            ship.position.x = ship.position.x - 10
        }
        
        //check every update if a missile is off screen
        for aSingleMissile in missiles {
            if aSingleMissile.position.y > 900 {
                aSingleMissile.removeFromParent()
                missiles.removeFirst()
            }
        }
        
        // randomly create alien
        let  createAlienChance = Int(arc4random_uniform(120) + 1)
        if createAlienChance <= alienAttackRate {
            createAlien()
        }
        
        //check to see if alien is off the bottom of the screen
        for aSingleAlien in aliens {
            if aSingleAlien.position.y < -50 {
                aSingleAlien.removeFromParent()
                aliens.removeFirst()
            }
        }
        
        //check each frame, to see if missile is touching alien
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        var touch = touches as!  Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "right button" {
                rightButtonPressed = true
            }
            else if touchedNodeName == "left button" {
                leftButtonPressed = true
            }
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch = touches as!  Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "right button" {
                rightButtonPressed = false
            }
            else if touchedNodeName == "left button" {
                leftButtonPressed = false
            }
            else if touchedNodeName == "fire button" {
                // fire missile
                let aMissile = SKSpriteNode(imageNamed: "missile.png")
                aMissile.position = CGPoint(x: (ship.position.x), y: 100)
                self.addChild(aMissile)
                let fireMissile = SKAction.moveTo(y: 1000, duration: 2.0)
                aMissile.run(fireMissile)
                missiles.append(aMissile)
                // now make the sound happen
                aMissile.run(SKAction.playSoundFileNamed("laser1.wav", waitForCompletion: false))
            }
        }
    }
    
    // user functions
    func fireMissile() {
        // fire a missile from current ship position
        
    }
    
    func createAlien() {
        // create a new alien
        let aSingleAlien = SKSpriteNode(imageNamed: "alien.png")
        let alienStartPositionX = Int(arc4random_uniform(1285 - 50) + 50)
        let alienEndPositionX = Int(arc4random_uniform(1285 - 50) + 50)
        aSingleAlien.position = CGPoint(x: alienStartPositionX, y: 900)
        let alienMove = SKAction.move(to: CGPoint(x:alienEndPositionX, y: -100), duration: 2.0)
        aSingleAlien.run(alienMove)
        self.addChild(aSingleAlien)
        aliens.append(aSingleAlien)
        
        
    }
}


// this will be commented out when code moved to Xcode
// set the frame to be the size for your iPad
let frame = CGRect(x: 0, y: 0, width: 1285, height: 815)

let scene = GameScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
//#-end-hidden-code