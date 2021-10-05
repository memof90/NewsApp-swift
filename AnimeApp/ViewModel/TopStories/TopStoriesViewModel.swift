//
//  TopAnimatesListViewModel.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import Foundation



struct TopStoriesViewModel  {
        let section: String
        let title: String
        let abstract: String
        let byline: String
        let itemType: ItemType
        let multimedia: [Multimedia]
    
    init(top: Results) {
        self.section = top.section
        self.title = top.title
        self.abstract = top.abstract
        self.byline = top.byline
        self.itemType = top.itemType
        self.multimedia = top.multimedia
    }
            
}

