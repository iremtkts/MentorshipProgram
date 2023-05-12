//
//  ViewController.swift
//  Dogs
//
//  Created by iremt on 6.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let dogImageView: UIImageView = {
       let dogImage = UIImageView()
        dogImage.image = UIImage(named: "dog.jpg")
        dogImage.translatesAutoresizingMaskIntoConstraints = false
        return dogImage
    }()
    
    private let changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 0
        button.setTitle("Change Picture", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(dogImageView)
        view.addSubview(changeButton)
        constraints()
       
    }
    
    func constraints(){
        // Dog ImageView Constraints
        dogImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        dogImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        dogImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dogImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //Button Constraints
        changeButton.topAnchor.constraint(equalTo:  dogImageView.bottomAnchor, constant: 30).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    @objc func buttonTapped(sender: UIButton) {
        print("button clicked")
    }
}

