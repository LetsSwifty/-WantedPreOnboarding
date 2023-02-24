//
//  WPService.swift
//  WantedPreOnboarding
//
//  Created by Taehwan Kim on 2023/02/24.
//

import Foundation

/// Primary API service object to get image Info
final class WPService {
    
    ///  Shared singleton instance
    static let shared = WPService()
    
    enum WPServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Privatized constructor
    private init()  {
        
    }
//    
//    /// Send Rick and Morty API Call
//    /// - Parameters:
//    ///   - request: Request instance
//    ///   - Type: The type of object we expect to get back
//    ///   - completion: Callback with data or Error
//    public func execute<T: Codable>(_ request: String,
//                                    completion: @escaping (Result<T, Error>) -> Void) {
//        
//        guard let urlRequest = self.request(from: request) else {
//            completion(.failure(WPServiceError.failedToCreateRequest))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
//            guard let data = data, error == nil else {
//                completion(.failure(error ?? WPServiceError.failedToGetData))
//                return
//            }
//            
//            do {
//                let result = try JSONDecoder().decode(type.self, from: data)
//                completion(.success(result))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//    
//    private func request(from rmRequest: RMRequest) -> URLRequest? {
//        guard let url = rmRequest.url else { return nil }
//        print(url)
//        var request = URLRequest(url: url)
//        request.httpMethod = rmRequest.httpMethod
//        
//        return request
//    }
//    
//    
    
}
