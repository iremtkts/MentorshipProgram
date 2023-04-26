//
//  WebService.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import Foundation
import Alamofire

class WebService {
    
    // GET Pharmacy Data
    
    func fetchData (city: String, district: String? = nil , completion : @escaping (Result <PharmacyResponse , Error>) -> Void) {
    

        // Yüzde işareti kodlaması (percent encoding) kullanarak ilçe adını düzeltin
        guard let safeDistrict = district else {
          print("Invalid district value")
            return
            }
        
        //https://api.collectapi.com/health/dutyPharmacy?ilce=%C3%87ankaya&il=Ankara
        let encodedDistrict = safeDistrict.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = "https://api.collectapi.com/health/dutyPharmacy?ilce=\(encodedDistrict)&il=\(city)"
        
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
            print("API anahtarı bulunamadı.")
            return
        }
        
        let headers: HTTPHeaders = [
            "content-type": "application/json",
            "authorization": "\(apiKey)"
        ]
        
        AF.request(url, method: .get, headers: headers).responseData { response in
            print("web service \(response)")
            
            switch response.result {
                
            case .success(let data):
                print(response.result)
                do {
                    let pharmacyResponse = try JSONDecoder().decode(PharmacyResponse.self, from: data)
                    completion(.success(pharmacyResponse))
                    print("pharmacy data successed \(data)")
                } catch {
                    completion(.failure(error))
                    print(error)
                }
            case .failure(let error):
                completion(.failure(error))
                print("pharmacy data error \(error)")
            }
        }
    }
    
    
    
    
    // GET District Data
    
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
            print("ilçe response \(response)")
            switch response.result {
            case .success(let data):
                do {
                    let districtResponse = try JSONDecoder().decode(DistrictResponse.self, from: data)
                    completion(.success(districtResponse.result))
                    print("district data successed \(data)")
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
                print("district data error \(error)")
            }
        }
    }
}
