//
//  NetworkService.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by dongyeongkang on 2023/02/17.
//

import Foundation

enum HTTPMethodType: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

enum APIError: Error {
    case defaultError
    case abnormalStatusCode
    case noResponseData
    case failUseCodable
    case responseDataError
    
    var localizedDescription: String {
        switch self {
        case .defaultError:
            return "일반적인 통신 에러"
        case .abnormalStatusCode:
            return "StatusCode 에러"
        case .noResponseData:
            return "응답값 없음"
        case .failUseCodable:
            return "Codable 변환 오류"
        case .responseDataError:
            return "응답 데이터 오류"
        }
    }
}

enum NetworkService {
    static let limit: Int = 30
    static let baseURL: String = "https://api.unsplash.com/"
    //typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
    
    case getImage(query: String, offset: Int, limit: Int)
    
    var url: String {
        return NetworkService.baseURL + path + defaultQueryParam
    }
    
    var method: HTTPMethodType {
        switch self {
        case .getImage:
            return .get
        }
    }
    
    var path: String {
        
        switch self {
        case .getImage:
            return "search/photos"
        }
    }
    
    var defaultQueryParam: String {
        let client_id: String = "?client_id=\(APIKey.unsplashKey)"
        return client_id
    }
    
    //var headerAuth
    var queryParam: String? {
        switch self {
        case .getImage(param: let param):
            return "&page=\(param.offset)&per_page=\(param.limit)&query=\(param.query)"
        }
    }
    
    var bodyParameter: Dictionary<String,Any>? {
        switch self {
        case .getImage:
            return nil
        }
    }
    
    func request<T: Decodable>(withDataType dataType: T.Type, completionHandler: @escaping ((Swift.Result<T, APIError>)->())) {
        var urlString = self.url
        
        if let encodedURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString = encodedURL
        }
        
        if let qParam = self.queryParam {
            urlString += qParam
        }
        
        
        let method = self.method
        let param = self.bodyParameter
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("task, data = \(data), response = \(response), error = \(error)")
            
            
        }
        
        task.resume()
    }
}
