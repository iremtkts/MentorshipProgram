//
//  DogViewModel.swift
//  Dogs
//
//  Created by iremt on 2.06.2023.
//

import Foundation
import SDWebImage


class DogViewModel {
    
    private let dogService = DogService
    weak var output: DogViewModelOutput?
    
    init(dogService: DogService) {
        self.dogService = dogService
    }
    
   
    
    func fetchData() {
        dogService.fetchData { [weak self] result in

            switch result {
            case .success(let dog):
                self?.output?.updateImage(message: dog.message)
            case .failure(NSError()):
                self?.output?.updateImage(message: "NO image")
            }
        }
        
    }
   
}
