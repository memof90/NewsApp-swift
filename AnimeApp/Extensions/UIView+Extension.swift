//
//  UIView+Extension.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import Foundation
import UIKit


extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
