//
//  UIColor+Extension.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 6/10/21.
//

import Foundation
import UIKit

extension UIColor {
    public class var random: UIColor {
        return UIColor(red: CGFloat(drand48()),
                       green: CGFloat(drand48()),
                       blue: CGFloat(drand48()), alpha: 1.0)
    }
}
