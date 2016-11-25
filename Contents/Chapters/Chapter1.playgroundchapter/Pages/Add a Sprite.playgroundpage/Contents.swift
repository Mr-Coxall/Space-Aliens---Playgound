//: # Add a Sprite
//: Sprites are objects which have properties.  We can manipulate the size, shape, colour, texture and behaviour of Sprites using SpriteKit.and
//: 
//: Below you can see we have imported the necessary library and created a GameScene which is a class of the sub-class SKScene.  In the didMove() method you must define a new **SKSpriteNode()** called square and define its size and position on the scene.  Once you have defined the properties you must add the node to the Scene witht he following code **addChild(shooter)**.
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
import SpriteKit

class GameScene:SKScene{
    override func didMove(to view: SKView){
        //#-editable-code
        
        //#-end-editable-code
    }
}

//: [Previous](@previous)  ||  [Next Topic](@next)

//#-hidden-code
let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code
