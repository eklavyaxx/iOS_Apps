import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
 

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
        
        // integer.random (in range 0 to 5) --> [Int.random(in: 0...5)]
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        
        // both diceArray.randomElement() and diceArray[Int.random(in: 0...5)] are same thing
        diceImageView2.image = diceArray.randomElement()
        
    }
    
}
