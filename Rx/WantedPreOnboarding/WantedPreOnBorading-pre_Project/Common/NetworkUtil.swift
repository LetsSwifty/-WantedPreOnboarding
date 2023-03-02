//
//  NetworkUtil.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by dongyeongkang on 2023/02/17.

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
