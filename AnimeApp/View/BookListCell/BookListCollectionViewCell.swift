//
//  BookListCollectionViewCell.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 6/10/21.
//

import UIKit
import Kingfisher

class BookListCollectionViewCell: UICollectionViewCell {
    
    
// MARK: - Identifier
    static let identifier = String(describing: BookListCollectionViewCell.self)

//    MARK: - IBOutlets
    
    @IBOutlet weak var imageBook: UIImageView!
    
    @IBOutlet weak var HotLbl: UILabel!
    
    @IBOutlet weak var tittleLbl: UILabel!
    
    @IBOutlet weak var rankLbl: UILabel!
    
    @IBOutlet weak var authorLbl: UILabel!
    
    @IBOutlet weak var contributorLbl: UILabel!
    
    
    func setupBooks(book: BookListsViewModel){
        
    
        
        for books in book.media {
            for image in books.mediaData {
                let url = URL(string: "\(image.url)")
                imageBook.kf.indicatorType = .activity
                imageBook.kf.setImage(
                    with: url,
                    placeholder:  UIImage(named: "Loading"),
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                         .transition(.fade(1)),
                         .cacheOriginalImage
                    ]
                
                )
            }
  
            
            tittleLbl.text = book.title
            rankLbl.text =  "date: \(book.publishedDate)"
            authorLbl.text = book.type
            contributorLbl.text = book.byline
        
            HotLbl.text = book.section
            HotLbl.backgroundColor = .random
        }
        
     
    }
    
}
