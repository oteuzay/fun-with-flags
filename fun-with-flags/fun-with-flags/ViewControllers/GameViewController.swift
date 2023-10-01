import UIKit

class GameViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreBarButton: UIBarButtonItem!
    
    var countries = [String]()
    
    var score = 0 {
        didSet {
            scoreBarButton.title = "Score: \(score)"
        }
    }
    var correctAnswer = 0 {
        didSet {
            let country = countries[correctAnswer]
            title = country.count > 2 ? country.capitalized : country.uppercased()
        }
    }
    
    var countPlay = 0
    var gameLimit = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureView()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func configureView() -> Void {
        view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
    
    func askQuestion(action: UIAlertAction! = nil) -> Void {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        countPlay += 1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String

        if sender.tag == correctAnswer {
            title = "🥳 Correct"
            message = "\(gameLimit - countPlay) plays left."
            score += 1
        } else {
            title = "🙁 Wrong"
            message = "That’s the flag of \(countries[sender.tag].count > 2 ? countries[sender.tag].capitalized : countries[sender.tag].uppercased())."
            message += "\n\(gameLimit - countPlay) plays left."
        }
        
        if countPlay < gameLimit {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(alertController, animated: true)
        } else {
            gameOver()
        }
    }
    
    func gameOver() -> Void {
        let alertController = UIAlertController(title: "Game Over", message: "Your score is \(score).", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { UIAlertAction in
            self.score = 0
            self.countPlay = 0
            self.askQuestion()
        }))
        
        alertController.addAction(UIAlertAction(title: "Exit", style: .cancel, handler: { UIAlertAction in
            self.dismiss(animated: true, completion: nil)
        }))
        
        present(alertController, animated: true)
    }
}
