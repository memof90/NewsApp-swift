//
//  Book.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 5/10/21.
//

import Foundation


struct BookList: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [NewsResults]
    
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.copyright = try container.decode(String.self, forKey: .copyright)
        self.numResults = try container.decode(Int.self, forKey: .numResults)
        self.results = try container.decode([NewsResults].self, forKey: .results)
    }
    
    
}


struct NewsResults : Codable {
    let source : String
    let section : String
    let publishedDate : String
    let byline : String
    let type: String
    let title : String
    let abstract: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case source, section, byline, title, abstract, type
        case publishedDate =  "published_date"
        case media
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(String.self, forKey: .source)
        self.section = try container.decode(String.self, forKey: .section)
        self.publishedDate = try  container.decode(String.self, forKey: .publishedDate)
        self.byline = try container.decode(String.self, forKey: .byline)
        self.type  = try container.decode(String.self, forKey: .type)
        self.title = try container.decode(String.self, forKey: .title)
        self.abstract = try container.decode(String.self, forKey: .abstract)
        self.media = try container.decode([Media].self, forKey: .media)
    }
}


struct Media : Codable {
    let mediaData: [LinksMedia]
    
    enum CodingKeys: String, CodingKey {
        case mediaData = "media-metadata"
    }
    
}

struct LinksMedia: Codable {
    let url: String
}
