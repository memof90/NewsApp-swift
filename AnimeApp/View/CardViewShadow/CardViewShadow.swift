//
//  CardViewShadow.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//


import UIKit


class CardViewShadow: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    /// Initial Setup to configure shadow
        private func initialSetup() {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = .zero
            layer.cornerRadius = 10
            layer.shadowOpacity = 0.1
            layer.shadowRadius = 10
            cornerRadius = 10
        }
}
