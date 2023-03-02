//
//  ImageLoadDTO.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by 강동영 on 2023/02/25.
//

import Foundation

// MARK: - UnsplashAPIResponse
struct UnsplashAPIResponse: Codable {
    let total, totalPages: Int
    let results: [ImageResult]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct ImageResult: Codable {
    let id: String
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case id
        case urls
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
