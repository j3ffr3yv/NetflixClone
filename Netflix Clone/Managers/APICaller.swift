//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Jeffrey Viramontes on 9/19/23.
//

import Foundation

struct Constants{
    static let API_KEY = "76d95dda755d4f4fb4cfc4a25f4f5f5f"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else{return
            
        }
        
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                print(results)
            }catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}