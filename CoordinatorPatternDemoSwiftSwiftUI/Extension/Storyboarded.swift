//
//  Storyboarded.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-27.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let sb = UIStoryboard(name: "Main", bundle: .main)
        return sb.instantiateViewController(withIdentifier: id) as! Self
    }
}

extension UIViewController: Storyboarded {}


extension UITableViewCell  {
   static var id: String {
        get {
            return String(describing: self)
        }
    }
}
