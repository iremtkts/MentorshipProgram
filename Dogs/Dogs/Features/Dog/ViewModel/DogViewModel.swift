//
//  DogViewModel.swift
//  Dogs
//
//  Created by iremt on 2.06.2023.
//

import Foundation
import SDWebImage


class DogViewModel {
    
    private let webService = WebService()
    
    func fetchData(completion: @escaping (Result<Dog,Error>)-> Void)  {
        webService.fetchData(completion: completion)
    }
    
   
}
