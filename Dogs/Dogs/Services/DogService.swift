//
//  DogService.swift
//  Dogs
//
//  Created by iremt on 18.06.2023.
//

import Foundation

protocol DogService {
    func fetchData (completion: @escaping(Result<Dog, Error>) -> Void)
}
