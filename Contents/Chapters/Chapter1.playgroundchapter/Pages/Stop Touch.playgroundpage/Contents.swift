//: # Stop Touch
//: In this page you need to make the Sprite move back to (x:250, y:250) as soon as the users finger is lifed off the screen.  In order to do this you must use the `touchesEnded` method.
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
            square.position = location
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
