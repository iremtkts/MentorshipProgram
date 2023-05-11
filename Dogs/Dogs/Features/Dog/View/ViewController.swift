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
    
    private let myButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 0
        button.setTitle("Show Another Picture", for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(dogImageView)
        view.addSubview(myButton)
        constraints()
       
    }
    
    func constraints(){
        // Dog ImageView Constraints
        dogImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dogImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dogImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dogImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //Button Constraints
        myButton.leadingAnchor.constraint(equalTo: dogImageView.leadingAnchor).isActive = true
        myButton.topAnchor.constraint(equalTo: dogImageView.bottomAnchor).isActive = true
        
    }
}

