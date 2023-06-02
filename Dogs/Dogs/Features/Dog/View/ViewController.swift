
import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    
    private let viewModel = DogViewModel()
    
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
        constraints()
       
    }
    
    func constraints(){
        // Dog ImageView Constraints
        view.addSubview(dogImageView)
        dogImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        dogImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        dogImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dogImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //Button Constraints
        view.addSubview(changeButton)
        changeButton.topAnchor.constraint(equalTo:  dogImageView.bottomAnchor, constant: 30).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    @objc func buttonTapped(_ sender: Any) {
        viewModel.fetchData { [weak self] result in
            switch result {
            case .success(let dog):
                DispatchQueue.main.async {
                    self?.dogImageView.sd_setImage(with: URL(string: dog.message), placeholderImage: UIImage(named: "dog.jpg"))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

