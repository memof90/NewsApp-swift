//
//  String+Extension.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import Foundation
import UIKit


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}


extension UIColor {
    public class var random: UIColor {
        return UIColor(red: CGFloat(drand48()),
                       green: CGFloat(drand48()),
                       blue: CGFloat(drand48()), alpha: 1.0)
    }
}
