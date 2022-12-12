//
//  Network.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 05/12/2022.
//

import Foundation
import SwiftUI

struct Network{

    func getCharacters(pUrl: String,
                       gender: String? = nil,
                       status: String? = nil,
                       completion: @escaping (CharactersResult) -> Void
    ) {
        
        var urlStr = pUrl
        if let mGender = gender{
            urlStr = "\(urlStr)&gender=\(mGender)"
        }
        if let mStatus = status{
            urlStr = "\(urlStr)&status=\(mStatus)"
        }
        
        
            guard let url = URL(string: urlStr) else {
               // self.fetchCharactersFromLocal(gender: gender, status: status)
                fatalError("Missing URL")
                
            }

            let urlRequest = URLRequest(url: url)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    return
                }

                if response.statusCode == 200 {
                    guard let data = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        do {
                            let decodedResult = try JSONDecoder().decode(CharactersResult.self, from: data)
                            completion(decodedResult)
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }
            dataTask.resume()
        }
}
