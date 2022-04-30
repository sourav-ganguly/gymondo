//
//  Networking.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 30/4/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case missingData
}

class Netwrking {
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T,Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        print(urlString, T.self)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error));
                return
            }
            completion( Result {
                try JSONDecoder().decode(T.self, from: data!)
            })
        }.resume()
    }
}
