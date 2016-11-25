//: #Introduction
//: In this Swift Playground you will be introduced to SpriteKit. SpriteKit is a framework from Apple to help with the development of 2D games. You will need to be familiar with the Swift programming language to complete this playground. If you have not complete the "Learn to Code 1" playground, stop here and go and finish that first. 
//: 
//: Now that you have finished "Learn to Code 1" or you are already a Swift programmer, lets start by playing the game that you will be making. Drag the live view window button on the right hand side of the screen, so that you have a full screen view to play the game in. Then press run and enjoy the game.

//: ![Single View Application](single_view.png)



//: [Previous](@previous)  ||  [Next Topic](@next)


// Created on: Nov-2016
// Created by: Mr. Coxall
// Created for: ICS3U
// This program is a Space Alien game, kind of like Space Invaders

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class GameScene: SKScene {
    // local variables to this scene
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
    }
}