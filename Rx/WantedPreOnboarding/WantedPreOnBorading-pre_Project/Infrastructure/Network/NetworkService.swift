//
//  NetworkService.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by dongyeongkang on 2023/02/17.
//

import Foundation

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
            guard let data = data, error == nil else {
                return
            }
            print("task, data = \(data), response = \(response), error = \(error)")
            do {
                let jsonResult = try JSONDecoder().decode(T.self, from: data)
                print("jsonResult = \(jsonResult)")
                debugPrint(response)
                completionHandler(.success(jsonResult))
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func useCodable<T: Decodable>(structType: T.Type, object:Any)-> T? {
        do {
            // JSON으로 변환
            let json = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            // Codable 이용하여 객체 얻음
            let object = try JSONDecoder().decode(structType, from: json)
            
            return object
            
        } catch(let e){
            print(e)
            return nil
        }
    }
}
