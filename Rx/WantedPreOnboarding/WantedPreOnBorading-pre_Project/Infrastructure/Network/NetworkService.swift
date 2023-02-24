//
//  NetworkService.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by dongyeongkang on 2023/02/17.
//

import Foundation

enum NetworkService {
    
    case getImage(query: String, offset: Int, limit: Int)
    
    var url
}

// https://api.unsplash.com/search/photos?page=0&per_page=30&query=movie&client_id=WA2JKNwlarkwdk5y86a6gyiI4rDYT7bhm2bpVZi3eh8
