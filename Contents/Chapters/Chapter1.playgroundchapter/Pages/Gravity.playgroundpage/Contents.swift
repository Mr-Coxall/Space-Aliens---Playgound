//: # Add Gravity
//: Swift has a built in physics engine which is designed to make game creation easy.
//:
//: First, we add gravity to our scene and set how quickly object will fall
//:
//: `self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)`
//:
//: Then, we define a boundary around the object
//:
//: `let squareSize = CGSize(width: square.size.width, height: square.size.height)`
//:
//: `square.physicsBody = SKPhysicsBody(rectangleOfSize: squareSize)`
//:
//: Finally, we set isDynamic to true
//:
//: `square.physicsBody?.isDynamic = true`
//: 
//:
//: **Experiment with the physics values and setting within the code below**
//#-hidden-code
import PlaygroundSupport
import SpriteKit

class GameScene:SKScene{
//#-end-hidden-code
    
    let square = SKSpriteNode()
    
    override func didMove(to view: SKView){
        square.size = CGSize(width: 50, height: 50)
        square.color = UIColor.blue
        square.position.x = 250
        square.position.y = 250
        self.addChild(square)
        //#-editable-code
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        let squareSize = CGSize(width: square.size.width, height: square.size.height)
        square.physicsBody = SKPhysicsBody(rectangleOf: squareSize)
        square.physicsBody?.isDynamic = true
        //#-end-editable-code
    }
    //#-hidden-code
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
        for touch in touches{
            let location = touch.location(in: self)
            square.position = location
        }
    }
    
    
    
}

let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code

//: [Previous](@previous)  ||  [Next Topic](@next)
