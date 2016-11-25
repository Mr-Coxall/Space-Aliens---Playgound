//: # Touch Location
//: In this page we are going to move the location of the square to where the user taps on the screen.  To do this we need to make the square object global so that we can manipulate the location of square in the touchesBegan() method.  
//:
//: **In the editable area set the square's position to equal the location**
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
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
    
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
        for touch in touches{
            let location = touch.location(in: self)
            //#-editable-code
            //#-end-editable-code
        }
    }
}

//: [Previous](@previous)  ||  [Next Topic](@next)

//#-hidden-code
let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code
