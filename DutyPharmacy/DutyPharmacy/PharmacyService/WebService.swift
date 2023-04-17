//
//  WebService.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import Foundation
import Alamofire

class WebService {
    
    /*
     
     var headers: [String: String] = [:]

     if let apiKey = ProcessInfo.processInfo.environment["API_KEY"] {
         headers = [
             "content-type": "application/json",
             "authorization": " \(apiKey)"
         ]
     } else {
         print("API anahtarı bulunamadı.")
     }

     let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/health/dutyPharmacy?ilce=%C3%87ankaya&il=Ankara")! as URL,
                                                 cachePolicy: .useProtocolCachePolicy,
                                             timeoutInterval: 10.0)
     request.httpMethod = "GET"
     request.allHTTPHeaderFields = headers

     let session = URLSession.shared
     let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
         if (error != nil) {
             print(error)
         } else {
             let httpResponse = response as? HTTPURLResponse
             print(httpResponse)
         }
     })

     dataTask.resume()
     
     */
    
    
    
    
    
    func fetchData (city: String, district: String? = nil , completion : @escaping (Result <String , Error>) -> Void) {
        
        let districtParameter = district != nil ? "&ilce=\(district!)" : ""
        let url = "https://api.collectapi.com/health/dutyPharmacy?il=\(city)\(districtParameter)"
        
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
                   print("API anahtarı bulunamadı.")
                   return
               }
        
        let headers: HTTPHeaders = [
                    "content-type": "application/json",
                    "authorization": "\(apiKey)"
                ]
        
        AF.request(url , method: .get , headers: headers).responseString { response in
            switch response.result {
            case .success(let data):
              completion(.success(data))
            case .failure(let error):
               completion(.failure(error))
            }
        }
        
    }
    
    func fetchDistrictData(forCity city: String,completion : @escaping (Result <[District] , Error >) -> Void) {
        
        let url = "https://api.collectapi.com/health/districtList?il=\(city)"
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
                   print("API anahtarı bulunamadı.")
                   return
               }
        
        let headers: HTTPHeaders = [
                    "content-type": "application/json",
                    "authorization": "\(apiKey)"
                ]
        
        AF.request(url, method: .get, headers: headers).responseData { response in
               switch response.result {
               case .success(let data):
                   do {
                       let districtResponse = try JSONDecoder().decode(DistrictResponse.self, from: data)
                       completion(.success(districtResponse.result))
                   } catch {
                       completion(.failure(error))
                   }
               case .failure(let error):
                   completion(.failure(error))
               }
           }
    }
    
}
