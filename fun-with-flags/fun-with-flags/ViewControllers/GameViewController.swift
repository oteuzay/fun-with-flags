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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureView()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)
    }
    
    func configureView() -> Void {
        view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
    
    func askQuestion(action: UIAlertAction!) -> Void {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String

        if sender.tag == correctAnswer {
            title = "🥳 Correct"
            message = ""
            score += 1
        } else {
            title = "🙁 Wrong"
            message = ""
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
}
