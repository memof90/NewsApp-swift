//
//  BookListsViewModel.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 5/10/21.
//

import Foundation


struct BookListsViewModel {
    
    let source : String
    let section : String
    let publishedDate : String
    let byline : String
    let type: String
    let title : String
    let abstract: String
    let media: [Media]
    
    init(book: NewsResults) {
        self.source = book.source
        self.section = book.section
        self.publishedDate = book.publishedDate
        self.byline = book.byline
        self.type = book.type
        self.title = book.title
        self.abstract = book.abstract
        self.media = book.media
    }
    
}




