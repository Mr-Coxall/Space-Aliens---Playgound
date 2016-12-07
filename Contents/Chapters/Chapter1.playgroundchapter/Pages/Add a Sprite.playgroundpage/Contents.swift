// Created on: Nov-2016
// Created by: Mr. Coxall
// Created for: ICS3U
// This program is a Space Alien game, kind of like Space Invaders

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let ship = SKSpriteNode(imageNamed: "spaceShip.png")
    let leftButton = SKSpriteNode(imageNamed: "leftButton.png")
    let rightButton = SKSpriteNode(imageNamed: "rightButton.png")
    let fireButton = SKSpriteNode(imageNamed: "redButton.png")
    let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    var score = 0
    var leftButtonPressed = false
    var rightButtonPressed = false
    var missiles = [SKSpriteNode]()
    var aliens = [SKSpriteNode]()
    var alienAttackRate = 1
    
    // for collision detection
    let collisionMissileCategory: UInt32  = 0x1 << 0
    let collisionAlienCategory: UInt32    = 0x1 << 1
    let collisionSpaceShipCategory: UInt32  = 0x1 << 2
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        // Handle contact/collisions
        self.physicsWorld.contactDelegate = self
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        let backgroundImage = SKSpriteNode(imageNamed: "star_background.png")
        backgroundImage.name = "background image"
        backgroundImage.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        backgroundImage.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(backgroundImage)
        
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.fontColor = #colorLiteral(red: 0.807843148708344, green: 0.0274509806185961, blue: 0.333333343267441, alpha: 1.0)
        scoreLabel.fontSize = 25
        scoreLabel.position = CGPoint(x: 25, y: frame.size.height - 50)
        self.addChild(scoreLabel)
        
        ship.position = CGPoint(x: (frame.size.width / 2), y: 100)
        ship.name = "space ship"
        ship.physicsBody?.isDynamic = true
        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, size: ship.size)
        ship.physicsBody?.affectedByGravity = false
        ship.physicsBody?.usesPreciseCollisionDetection = true
        ship.physicsBody?.categoryBitMask = collisionSpaceShipCategory
        ship.physicsBody?.contactTestBitMask = collisionAlienCategory
        ship.physicsBody?.collisionBitMask = 0x0
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
        fireButton.position = CGPoint(x: frame.size.width - 100, y: 100)
        fireButton.alpha = 0.5
        self.addChild(fireButton)
        fireButton.setScale(0.75)
        
        // start game with a single alien attack
        createAlien()
    }
    
    override func  update(_ currentTime: TimeInterval) {
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
            //ship.run(moveShipLeft)'
            ship.position.x = ship.position.x - 10
        }
        
        //check every update if a missile is off screen
        for aSingleMissile in missiles {
            if aSingleMissile.position.y > screenSize.height {
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
        // http://soundbible.com/576-Barrel-Exploding.html
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let secondNode = contact.bodyB.node as! SKSpriteNode
        
        //if ((contact.bodyA.categoryBitMask == collisionAlienCategory) &&  
        //(contact.bodyB.categoryBitMask == collisionMissileCategory)) ||
        //((contact.bodyA.categoryBitMask == collisionMissileCategory) &&  
        //(contact.bodyB.categoryBitMask == collisionAlienCategory)) {
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionAlienCategory | collisionMissileCategory)) {
            // remove missile and alien
            ship.run(SKAction.playSoundFileNamed("BarrelExploding.wav", waitForCompletion: false))
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            score += 1
            scoreLabel.text = "Score: " + String(score)
        }
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
                aMissile.position = CGPoint(x: ship.position.x, y: 100)
                aMissile.name = "missile"
                aMissile.physicsBody?.isDynamic = true
                aMissile.physicsBody = SKPhysicsBody(texture: aMissile.texture!, size: aMissile.size)
                aMissile.physicsBody?.affectedByGravity = false
                aMissile.physicsBody?.usesPreciseCollisionDetection = true
                aMissile.physicsBody?.categoryBitMask = collisionMissileCategory
                aMissile.physicsBody?.contactTestBitMask = collisionSpaceShipCategory
                aMissile.physicsBody?.collisionBitMask = 0x0
                self.addChild(aMissile)
                let fireMissile = SKAction.moveTo(y: frame.size.height + 100, duration: 2)
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
        aSingleAlien.name =  "alien"
        aSingleAlien.physicsBody?.isDynamic = true
        aSingleAlien.physicsBody = SKPhysicsBody(texture: aSingleAlien.texture!, size: aSingleAlien.size)
        aSingleAlien.physicsBody?.affectedByGravity = false
        aSingleAlien.physicsBody?.usesPreciseCollisionDetection = true
        aSingleAlien.physicsBody?.categoryBitMask = collisionAlienCategory
        aSingleAlien.physicsBody?.contactTestBitMask = collisionMissileCategory
        aSingleAlien.physicsBody?.collisionBitMask = 0x0
        let alienStartPositionX = Int(arc4random_uniform(UInt32(frame.size.width - 0 + 1)))
        let alienEndPositionX = Int(arc4random_uniform(UInt32(frame.size.width - 0 + 1)))
        aSingleAlien.position = CGPoint(x: alienStartPositionX, y: Int(frame.size.height) + 100)
        let alienMove = SKAction.move(to: CGPoint(x:alienEndPositionX, y: -100), duration: 4)
        aSingleAlien.run(alienMove)
        self.addChild(aSingleAlien)
        aliens.append(aSingleAlien)
    }
}


// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad

let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = GameScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
