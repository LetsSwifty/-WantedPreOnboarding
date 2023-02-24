//
//  ConnectionError.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by dongyeongkang on 2023/02/17.
//  https://api.unsplash.com/search/photos?page=\(pages)&per_page=30&query=\(query)&client_id=\(client_id)
// https://api.unsplash.com/search/photos?page=0&per_page=30&query=movie&client_id=WA2JKNwlarkwdk5y86a6gyiI4rDYT7bhm2bpVZi3eh8
// WA2JKNwlarkwdk5y86a6gyiI4rDYT7bhm2bpVZi3eh8

import Foundation

public protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

public extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}
