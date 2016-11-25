//: # Drag & Drop
//: As well as the `touchesBegan()` method, Swift also has other methods which can be utilised for user interaction.
//: * the `touchesMoved()` method is called when the user moves their finger across the screen
//: * the `touchesEnded()` method is called when the user removes finger from the screen
//:
//: Use the `touchesMoved()` method so that your ship follows your finger around the screen.
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
    //#-editable-code
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
        for touch in touches{
            let location = touch.location(in: self)
            square.position = location
        }
    }
    //#-end-editable-code
    //#-hidden-code
}

let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code

//: [Previous](@previous)  ||  [Next Topic](@next)
