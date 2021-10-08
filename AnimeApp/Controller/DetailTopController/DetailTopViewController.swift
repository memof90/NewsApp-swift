//
//  DetailViewController.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 7/10/21.
//

import UIKit
import Kingfisher


class DetailTopViewController: UIViewController {
    
//    MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var hotLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    

    @IBOutlet weak var abstractLabel: UILabel!
    
//    MARK: - Data
    var top : TopStoriesViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func topView() {
        for tops in top.multimedia {
            imageView.kf.setImage(with: tops.url.asUrl,
                                  placeholder: UIImage(named: top.title),
                                  options: [
                                 .scaleFactor(UIScreen.main.scale),
                                 .transition(.fade(1)),
                                 .cacheOriginalImage
                                 ]
            )
        }
        
        
        hotLbl.text = top.section
        hotLbl.backgroundColor = .random
        typeLbl.text = top.itemType.rawValue
        typeLbl.backgroundColor = .random
        titleLbl.text = top.title
        abstractLabel.text = top.abstract
        
        
    }
    
//     MARK: - dismiss
    
    @IBAction func leaveBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
