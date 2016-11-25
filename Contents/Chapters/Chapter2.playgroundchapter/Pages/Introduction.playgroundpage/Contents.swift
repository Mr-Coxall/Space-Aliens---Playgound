//: # Project Introduction
//: In this mini project we are going to use what we have learnt to create a Sprite Invaders game.  This game will be very simple in nature but will allow you to build much bigger game in the future.
//: ## Project Setup
//: To create the game we will be creating a "GameScene" which is a class of the sub-class SKScene.  You don't need to worry about this or even understand it, just know that your code must sit within one of three methods inside this class
//: We will focus on individual sections of this entire structure thoughout the project.  To make this less confusing some of the code will be hidden.

import PlaygroundSupport
import SpriteKit

class GameScene:SKScene{
    override func didMove(to view: SKView){
        //functions you wish to load in the beginning
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //function to handle when a user touches the screen
    }
    
    override func update(_ currentTime: TimeInterval){
        //function which is called everytime the frames refresh
    }
}

//: [Previous](@previous)  ||  [Next Topic](@next)

//#-hidden-code
let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code
