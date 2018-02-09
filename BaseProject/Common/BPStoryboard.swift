//
//  BPStoryboard.swift
//  BaseProject
//
//  Created by Hoang Anh on 2/9/18.
//  Copyright © 2018 Hoang Anh. All rights reserved.
//

import Foundation
import UIKit

enum BPStoryboard: String {
    case login      = "Login"
    case main       = "Main"
    
    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    /** Load view controller from storyboard
     
     - Parameters:
     - viewControllerClass: View controller class
     - vcIdentifier: View controller identifier in storyboard
     - Return: New view controller
     */
    func loadViewController<T: UIViewController>(viewControllerClass: T.Type, vcIdentifier: String? = nil) -> T {
        let vc: UIViewController?
        let storyboard = self.getStoryboard()
        if let id = vcIdentifier {
            vc = storyboard.instantiateViewController(withIdentifier: id)
        } else if let id = String(T.self), id != "UINavigationController" {
            vc = storyboard.instantiateViewController(withIdentifier: id)
        } else {
            vc = storyboard.instantiateInitialViewController()
        }
        guard let controller = vc as? T else {
            fatalError("Fail to load view controller of type \(T.classForCoder()) with id \(vcIdentifier ?? "<initial>")")
        }
        return controller
    }
}

extension UIViewController {
    
    /** Load view controller from storyboard
     
     - Parameters:
     - storyboard: Storyboard
     - identifier: View controller identifier. Pass nill to load Initial View Controller.
     - Returns: New view controller
     */
    class func loadFromStoryboard(storyboard: BPStoryboard, identifier: String? = nil) -> Self {
        return storyboard.loadViewController(viewControllerClass: self, vcIdentifier: identifier)
    }
}

