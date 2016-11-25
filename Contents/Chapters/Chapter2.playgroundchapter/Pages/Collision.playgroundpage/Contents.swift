//: # Collision Detection
//: The update() method creates a continual loop which refreshes with the framerate.  Create some logic to detect for collisions.

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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first{
            createBullet()
        }
    }
    
    func createBullet(){
        let bullet = SKSpriteNode()
        bullet.size = CGSize(width:10, height:10)
        bullet.color = UIColor.blue
        bullet.position.x = shooter.position.x
        bullet.position.y = shooter.position.y + 50
        
        //bullet movement
        let move = SKAction.moveTo(y:500, duration: 2)
        let remove = SKAction.removeFromParent()
        let shootAndRemove = SKAction.sequence([move, remove])
        
        self.addChild(bullet)
        bullet.run(shootAndRemove)
    }
    //#-end-hidden-code
    
    override func update(_ currentTime:TimeInterval){
        //#-editable-code
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
