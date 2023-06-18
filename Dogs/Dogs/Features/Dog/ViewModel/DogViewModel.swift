//
//  DogViewModel.swift
//  Dogs
//
//  Created by iremt on 2.06.2023.
//

import Foundation



class DogViewModel {
    
    private var dogService = APIManager()
    
    weak var output: DogViewModelOutput?
    
    init(dogService: APIManager) {
        self.dogService = dogService
    }
    
   
    
    func fetchData() {
        dogService.fetchData { [weak self] result in

            switch result {
            case .success(let dog):
                self?.output?.updateImage(message: dog.message)
            case .failure(_):
                self?.output?.updateImage(message: "NO image")
            }
        }
        
    }
   
}
