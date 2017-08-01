//
//  NibLoadableView.swift
//  tacoPOP
//
//  Created by Neil Patel on 7/31/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }
//we can conform to this where we have nib file, we can actually use the name of the nib instead of having to keep up with the name of the nib

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
