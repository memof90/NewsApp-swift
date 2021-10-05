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
    let lastModified: String
    let results: BookResults
    
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case lastModified = "last_modified"
        case numResults = "num_results"
        case results
    }
    
}


struct BookResults : Codable {
    let publishedDate : String
    let bestsellersDate : String
    let books: [BooksDetail]
    
    enum CodingKeys: String, CodingKey {
        case publishedDate =  "published_date"
        case bestsellersDate = "bestsellers_date"
        case books
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.publishedDate = try  container.decode(String.self, forKey: .publishedDate)
        self.bestsellersDate = try container.decode(String.self, forKey: .bestsellersDate)
        self.books = try container.decode([BooksDetail].self, forKey: .books)
    }
}


struct BooksDetail : Codable {
    let rank: Int
    let description : String
    let title: String
    let author: String
    let contributor: String
    let bookImage: String
    let amazonProduct: String
    let buyLinks: [LinksBooks]
    
    enum CodingKeys: String, CodingKey {
        case rank
        case description,title,author,contributor
        case amazonProduct = "amazon_product_url"
        case bookImage = "book_image"
        case buyLinks = "buy_links"
    }
    
}

struct LinksBooks: Codable {
    let name: String
    let url: String
}
