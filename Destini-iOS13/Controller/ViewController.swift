//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private static let fontSize: CGFloat = 23.0
    private static let spacing: CGFloat = 16.0
    
    private let redButton = UIButton.customButton(color: #colorLiteral(red: 0.9833430648, green: 0.248759836, blue: 0.4750057459, alpha: 1), title: "Choise 1", fontSize: fontSize)
    private let purpleButton = UIButton.customButton(color: #colorLiteral(red: 0.5703944564, green: 0.342150569, blue: 0.6694917083, alpha: 1), title: "Choise 1", fontSize: fontSize)
    private let storyTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Story Text"
        label.font = UIFont.systemFont(ofSize: fontSize + 2)
        label.textColor = .white
        return label
    }()
    private let backImage: UIImageView = {
        let image = UIImage(named: "background")
        let backimage = UIImageView(image: image!)
        backimage.translatesAutoresizingMaskIntoConstraints = false
        return backimage
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storyTextLabel, redButton, purpleButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Self.spacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
}

private extension UIButton {
    static func customButton(color: UIColor, title: String, fontSize: CGFloat) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([button.heightAnchor.constraint(equalToConstant: 100)])
        return button
    }
}
