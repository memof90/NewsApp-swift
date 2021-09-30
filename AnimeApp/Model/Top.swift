//
//  Top.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import Foundation

struct TopAnimes: Codable {
    
    let requestHash : String?
    let requestCached : Bool?
    let requestCacheExpiry: Int?
    let top : [Top]?
    
    enum CodingKeys : String , CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case top
    }
}


struct Top : Codable {
    let mailId: Int
    let rank: Int
    let title: String
    let url: String
    let imageURL: String
    let type: String
    let episodes: Int?
    let startDate: String
    let endDate: String?
    let members: Int
    let score: Double
    
    enum CodingKeys: String, CodingKey {
        case mailId = "mal_id"
        case rank
        case title
        case url
        case imageURL = "image_url"
        case type
        case episodes
        case startDate = "start_date"
        case endDate =  "end_date"
        case members
        case score
    }
}
