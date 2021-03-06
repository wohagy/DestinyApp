
import UIKit

class ViewController: UIViewController {
    
    var game = StoryBrain()
    
    private var numberOfQuest = 0

    private static let fontSize: CGFloat = 23.0
    private static let spacing: CGFloat = 16.0
    
    private let choiseButton1: AnswerButton = {
        let button = AnswerButton()
        button.customButton(color: #colorLiteral(red: 0.9833430648, green: 0.248759836, blue: 0.4750057459, alpha: 1), fontSize: fontSize)
        button.addTarget(self, action: #selector(choiseButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private let choiseButton2: AnswerButton = {
        let button = AnswerButton()
        button.customButton(color: #colorLiteral(red: 0.5703944564, green: 0.342150569, blue: 0.6694917083, alpha: 1), fontSize: fontSize)
        button.addTarget(self, action: #selector(choiseButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private let storyTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize + 2)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let backImage: UIImageView = {
        let image = UIImage(named: "background")
        let backimage = UIImageView(image: image!)
        backimage.translatesAutoresizingMaskIntoConstraints = false
        return backimage
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storyTextLabel, choiseButton1, choiseButton2])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Self.spacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateUI()
    }

    private func setupView() {
        view.addSubview(backImage)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            // constraiting background image
            backImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -1),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
            
            //constraiting stack view
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        ])
    }
    
    @objc private func choiseButtonAction(_ sender: UIButton){
        guard let answer = sender.currentTitle else {return}
        game.answerChoose(with: answer)
        updateUI()
    }
    
    private func updateUI(){
        numberOfQuest = game.numberOfQuest
        storyTextLabel.text = game.stories[numberOfQuest].title
        choiseButton1.setTitle(game.stories[numberOfQuest].choise1, for: .normal)
        choiseButton2.setTitle(game.stories[numberOfQuest].choise2, for: .normal)
    }
    
}

private extension UIButton {
    
    func customButton(color: UIColor, fontSize: CGFloat) {
        self.backgroundColor = color
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: 100)])
    }
}
