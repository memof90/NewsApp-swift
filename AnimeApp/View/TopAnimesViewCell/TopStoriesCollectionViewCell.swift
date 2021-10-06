//
//  TopAnimesCollectionViewCell.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import UIKit
import Kingfisher

class TopStoriesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Cell Identifier
    static let identifier = String(describing: TopStoriesCollectionViewCell.self)
    
    @IBOutlet weak var imageViewTopAnimes: UIImageView!
    
    @IBOutlet weak var titleImageLbl: UILabel!
    
    
    func setupTopAnimes(top: TopStoriesViewModel) {
        
        
        for name in top.multimedia {
//            print(name.url)
            let url = URL(string: "\(name.url)")
            imageViewTopAnimes.kf.indicatorType = .activity
            imageViewTopAnimes.kf.setImage(
                with: url,
                placeholder:  UIImage(named: "\(top.title)"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                     .transition(.fade(1)),
                     .cacheOriginalImage
                ]
            
            )
        }
        
        titleImageLbl.text = top.title
    }
    
    
}

