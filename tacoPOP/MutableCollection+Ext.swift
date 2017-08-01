//
//  MutableCollection+Ext.swift
//  tacoPOP
//
//  Created by Neil Patel on 8/1/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    
//want to shuffle the collection
    
    mutating func shuffle() {
        if count < 2 {return}
        
        for i in startIndex..<endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex-i))) + i
            guard i != j else {continue}
            swap(&self[i], &self[j])
            //shuffles any mutable collection with integer index
        }
    }
}
