//: # Add Platform
//: Create a plaform which will sit at the bottom of the screen. The only difference between the square and the platform will be that `isDyamic` will be set to false.  This will mean that the plaform will remain stationary and won't be affected by gravity.
//:
//#-hidden-code
import PlaygroundSupport
import SpriteKit
//#-end-hidden-code

class GameScene:SKScene{

    let square = SKSpriteNode()
    
    override func didMove(to view: SKView){
        square.size = CGSize(width: 50, height: 50)
        square.color = UIColor.blue
        square.position.x = 250
        square.position.y = 250
        self.addChild(square)
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        let squareSize = CGSize(width: square.size.width, height: square.size.height)
        square.physicsBody = SKPhysicsBody(rectangleOf: squareSize)
        square.physicsBody?.isDynamic = true
        
        createPlatform()
    }
    
    func createPlatform(){
        let platform = SKSpriteNode()
        //#-editable-code
        //#-end-editable-code
        self.addChild(platform)
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
        for touch in touches{
            let location = touch.location(in: self)
            square.position = location
        }
    }
}

//#-hidden-code
let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code

//: [Previous](@previous)  ||  [Next Topic](@next)
