//
//  String+Extension.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
