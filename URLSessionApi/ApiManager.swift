//
//  ApiManager.swift
//  URLSessionApi
//
//  Created by User on 31.07.2023.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    let url = "https://api.kinopoisk.dev/v1.3/movie?page=1&limit=10"
    
    func filmsList(completion: @escaping ([Doc]) -> Void  ) {
        guard let url = URL(string: url) else {
            print("Server error")
            return
        }
        var request = URLRequest(url: url)
        request.addValue("MP3QN5M-VZBMN34-KTKD5RQ-EBAGWS2", forHTTPHeaderField: "X-API-KEY")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, erorr in            
            guard let data = data else { return }
            if let filmsData = try? JSONDecoder().decode(Films.self, from: data) {
                completion(filmsData.docs)
            } else {
                print("ERORR")
            }
        }
        
        task.resume()
    }
}
