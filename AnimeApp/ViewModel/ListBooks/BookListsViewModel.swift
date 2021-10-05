//
//  BookListsViewModel.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 5/10/21.
//

import Foundation


struct BookListsViewModel {
    
    let publishedDate : String
    let bestsellersDate : String
    var books: [BooksDetail]
    
    init(book: BookResults) {
        self.publishedDate = book.publishedDate
        self.bestsellersDate = book.bestsellersDate
        self.books = book.books
    }
    
}

//struct BookDetailViewModel {
//        let rank: Int
//        let description : String
//        let title: String
//        let author: String
//        let contributor: String
//        let bookImage: String
//        let amazonProduct: String
//        let buyLinks: [LinksBooks]
//
//        init(book: BooksDetail) {
//            self.rank = book.rank
//            self.description = book.description
//            self.title = book.title
//            self.author = book.author
//            self.contributor = book.contributor
//            self.bookImage  = book.bookImage
//            self.amazonProduct = book.amazonProduct
//            self.buyLinks = book.buyLinks
//        }
//}



