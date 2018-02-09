//
//  BPExtension.swift
//  BaseProject
//
//  Created by Hoang Anh on 2/9/18.
//  Copyright © 2018 Hoang Anh. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension String {
    init?(_ object: Any?) {
        if let s = object as? String {
            self = s
        } else if let obj = object {
            self = "\(obj)"
        } else {
            return nil
        }
    }
    
    init(_ bool: Bool) {
        self = bool ? "1" : "0"
    }
}

extension UIImageView {
    func setImageWithPlaceholder(url: String) {
        self.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
}
