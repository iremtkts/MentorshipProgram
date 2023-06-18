//
//  APIManager.swift
//  Dogs
//
//  Created by iremt on 18.06.2023.
//

import Foundation

class APIManager: DogService {
    func fetchData (completion: @escaping (Result <Dog , Error>) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else if let data {
                do{
                    let dogResponse = try JSONDecoder().decode(Dog.self, from: data)
                    print(dogResponse.message)
                    completion(.success(dogResponse))
                }
                catch let error {
                    print("Decoding error: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
                }

        }.resume()
    }

    
    
}
