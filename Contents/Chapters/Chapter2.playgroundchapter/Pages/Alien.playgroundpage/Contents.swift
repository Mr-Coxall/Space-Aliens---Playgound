//: # The Alien
//: Modify the createAlien() function below to create an Alien.  The Alien will simply be a green box with a height and width of 30px.  The Alien will appear at the top of the page (500,500) and move in a snake like fashion towards the shooter.  You still need to use the SKAction() to create the movement. 
//#-hidden-code
import PlaygroundSupport
import SpriteKit

class GameScene:SKScene{
    
    override func didMove(to view: SKView){
        createShooter()
        createAlien()
    }
    
    func createShooter(){
        let shooter = SKSpriteNode(imageNamed:"Spaceship")
        shooter.position.x = 250
        shooter.position.y = 100
        shooter.size = CGSize(width:133, height:115)
        addChild(shooter)
    }
    //#-end-hidden-code
    
    func createAlien(){
        //#-editable-code
        //#-end-editable-code
    }
    
    
//: [Previous](@previous)  ||  [Next Topic](@next)
//#-hidden-code
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //function to handle when a user touches the screen
    }
}

let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code
