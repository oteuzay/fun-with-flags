import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() -> Void {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        backgroundImage.image = UIImage(named: "BG.jpg")
        backgroundImage.alpha = 0.1

        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}
