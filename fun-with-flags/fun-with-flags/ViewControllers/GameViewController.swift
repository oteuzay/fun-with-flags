import UIKit

class GameViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    
    var score = 0
    var correctAnswer = 0 {
        didSet {
            var country = countries[correctAnswer]
            title = country.count > 2 ? country.capitalized : country.uppercased()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureView()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func configureView() -> Void {
        view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
    
    func askQuestion() -> Void {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
}
