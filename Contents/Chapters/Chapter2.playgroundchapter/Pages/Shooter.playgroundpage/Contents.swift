//: # The Shooter
//: First we are going to create a Shooter which will be our main character in the game which will eventually shoot bullets at the alien.alien
//: In the code above you can that when the didMove() method is called a function called createShooter() is also called.  Modify the fuction below to set the size of the shooter to 133x115 and move it to the position of 10,10.
//#-hidden-code
import PlaygroundSupport
import SpriteKit

class GameScene:SKScene{
//#-end-hidden-code
    override func didMove(to view: SKView){
        createShooter()
    }
    
    func createShooter(){
        //#-editable-code
        let shooter = SKSpriteNode(imageNamed:"Spaceship")
        addChild(shooter)
        //#-end-editable-code
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //function to handle when a user touches the screen
    }
//: [Previous](@previous)  ||  [Next Topic](@next)
//#-hidden-code
}

let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code

