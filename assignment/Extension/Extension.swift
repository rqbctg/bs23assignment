//
//  Extension.swift
//  assignment
//
//  Created by Miaki Limited on 2/16/24.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension String {
    
    var mediaPath: String {
        return "https://image.tmdb.org/t/p/w500"
    }
    
    var mediaURL: URL? {
        return URL(string: mediaPath + self)
    }
    
}


