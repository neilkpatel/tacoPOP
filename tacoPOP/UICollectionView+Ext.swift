//
//  UICollectionView+Ext.swift
//  tacoPOP
//
//  Created by Neil Patel on 7/31/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

import UIKit

//all collectionviews in code will have this functionality
extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
  
// ?????
        //????
        //?????

        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forindexPath indexPath: IndexPath) -> T where T: ReusableView {
    
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else { //???diff types of iNdExPaTh
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionViewCell: ReusableView {}
