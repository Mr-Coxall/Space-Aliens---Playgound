//: # Gliding
//: You can create actions using the method **SKAction()** which can then be applied to the Sprite.
//:
//: Create an action with the following line of code:
//:
//: `let action = SKAction.move(to: location, duration: 0.5)`
//:
//: Once the action is created you must apply it to the Sprite with the following line of code:
//:
//: `square.run(action)`
//:
//: Modify the **touchesBegan()** method below to make your Sprite glide to where the user touches.
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
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
        for touch in touches{
            let location = touch.location(in: self)
            //#-editable-code
            //#-end-editable-code
        }
    }
//#-hidden-code
}

let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code

//: [Previous](@previous)  ||  [Next Topic](@next)
