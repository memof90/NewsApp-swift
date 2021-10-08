//
//  DetailBookController.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 7/10/21.
//

import UIKit
import Kingfisher


class DetailBookController: UIViewController {
    
    
//     MARK: - IBoutlets
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var bussinessLbl: UILabel!
    
    @IBOutlet weak var imageLbl: UIImageView!
    
    @IBOutlet weak var byLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var abstractLbl: UILabel!
    
//    MARK: - data
    var book: BookListsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
         bookView()
    }
    
    private func bookView() {
        for multimedia in book.media {
            for images in  multimedia.mediaData {
                imageLbl.kf.setImage(with: images.url.asUrl,
                                      placeholder: UIImage(named: book.title),
                                      options: [
                                     .scaleFactor(UIScreen.main.scale),
                                     .transition(.fade(1)),
                                     .cacheOriginalImage
                                     ]
                )
            }
        }
        
        titleLbl.text = book.title
        titleLbl.font = UIFont.boldSystemFont(ofSize: 20)
        dateLbl.text = book.publishedDate
        dateLbl.backgroundColor = .random
        bussinessLbl.text = book.section
        bussinessLbl.backgroundColor = .random
        byLbl.text = book.byline
        typeLbl.text = book.type
        abstractLbl.text = book.abstract
        
    }
    
//    MARK: - Actions
    
    @IBAction func leaveBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
