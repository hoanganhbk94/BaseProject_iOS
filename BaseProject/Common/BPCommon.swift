//
//  BPCommon.swift
//  BaseProject
//
//  Created by Hoang Anh on 2/9/18.
//  Copyright © 2018 Hoang Anh. All rights reserved.
//

import Foundation
import UIKit

func localString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

func openUrl(_ urlStr: String) -> Bool {
    if let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
            return true
        } else {
            return UIApplication.shared.openURL(url)
        }
    }
    return false
}
