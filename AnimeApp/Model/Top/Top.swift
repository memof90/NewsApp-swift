//
//  Top.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import Foundation



struct TopStories: Codable {
    let status: String
    let copyright: String
    let section: String
    let lastUpdated: String
    let numResults: Int
    let results : [Results]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

struct Results : Codable {
    let section: String
    let title: String
    let abstract: String
    let byline: String
    let itemType: ItemType
    let publishedDate: String
    let multimedia: [Multimedia]
    
    enum CodingKeys: String, CodingKey {
        case section, title, abstract, byline
        case itemType = "item_type"
        case publishedDate = "published_date"
        case multimedia
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.section = try container.decode(String.self, forKey: .section)
        self.title = try container.decode(String.self, forKey: .title)
        self.abstract = try container.decode(String.self, forKey: .abstract)
        self.byline = try container.decode(String.self, forKey: .byline)
        self.itemType = try container.decode(ItemType.self, forKey: .itemType)
        self.publishedDate = try container.decode(String.self, forKey: .publishedDate)
        self.multimedia = try  container.decode([Multimedia].self, forKey: .multimedia)
    }
}

enum ItemType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}

struct Multimedia: Codable {
    let url: String
}


