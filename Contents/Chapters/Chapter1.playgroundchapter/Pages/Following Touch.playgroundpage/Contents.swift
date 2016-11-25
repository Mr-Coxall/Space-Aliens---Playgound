//: # Following Touch
//: You'll notice in the `touchesMoved()` method below the location is passed to a function called `moveSquare`. Create the `moveShip()` function which will have a parameter of type CGPoint.  The parameter will be used in a SKAction to move the square.
//#-hidden-code
import PlaygroundSupport
import SpriteKit

class GameScene:SKScene{
    
    let square = SKSpriteNode()
    
    override func didMove(to view: SKView){
        square.size = CGSize(width: 50, height: 50)
        square.color = UIColor.blue
        square.position.x = 250
        square.position.y = 250
        self.addChild(square)
    }
    //#-end-hidden-code
    override func touchesMoved(_ touches:Set<UITouch>, with event: UIEvent?){
        for touch in touches{
            let location = touch.location(in: self)
            moveSquare(location)
        }
    }
    //#-editable-code
    //#-end-editable-code
    //#-hidden-code
}

let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code

//: [Previous](@previous)  ||  [Next Topic](@next)
