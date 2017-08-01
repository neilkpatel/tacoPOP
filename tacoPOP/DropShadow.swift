//
//  DropShadow.swift
//  tacoPOP
//
//  Created by Neil Patel on 7/30/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

import UIKit //because dealing with views, viewcontrollers, UIkit in general, etc.

protocol DropShadow {} //define requirements in protocol, implement functionality in extensions

//constrain extension to certain type. Self with big S refers to protocol. Constrained to UIView
extension DropShadow where Self: UIView {
    func addDropShadow (){
    //implementation
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5

    }
}


