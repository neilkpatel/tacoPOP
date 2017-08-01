//
//  ReusableView.swift
//  tacoPOP
//
//  Created by Neil Patel on 7/31/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

//import Foundation

import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView { //constraints to UIView
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
//this protocol takes the name of your class as reuse identifier. don't worry about it anymore.
}
