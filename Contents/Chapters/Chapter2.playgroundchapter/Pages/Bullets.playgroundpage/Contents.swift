//: # Shooting Bullets
//: Modify the createBullet() function to create a bullet every time the user taps on the screen.  The bullet must continuously travel towards the top of the screen using SKActions.
//#-hidden-code
import PlaygroundSupport
import SpriteKit

class GameScene:SKScene{
    let shooter = SKSpriteNode(imageNamed:"Spaceship")
    let alien = SKSpriteNode()
    let bullet = SKSpriteNode()
    
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
    
    func createAlien(){
        alien.color = UIColor.green
        alien.size = CGSize(width:30, height:30)
        alien.position = CGPoint(x:500, y:500)
        addChild(alien)
        
        //alien movement
        let right = SKAction.moveTo(x:500, duration:1)
        let left = SKAction.moveTo(x:0, duration:1)
        let drop = SKAction.moveBy(x:0, y:-50.0, duration: 0.1)
        
        let alienAction = SKAction.sequence([right,drop,left,drop])
        let repeatAction = SKAction.repeatForever(alienAction)
        
        alien.run(repeatAction)
    }
    //#-end-hidden-code
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        createBullet()
    }
    
    func createBullet(){
        //#-editable-code
        //add your code here
        //#-end-editable-code
    }
    
//: [Previous](@previous)  ||  [Next Topic](@next)
//#-hidden-code
}

let scene = GameScene(size:CGSize(width:500, height:500))
let view = SKView(frame: CGRect(x:0, y:0, width:500, height:500))
view.presentScene(scene)
PlaygroundPage.current.liveView = view
//#-end-hidden-code
