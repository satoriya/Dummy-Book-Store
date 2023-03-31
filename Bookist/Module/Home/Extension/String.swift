//
//  String.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 31/03/23.
//

import Foundation

extension String {
    public func df2so(_ price: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        return numberFormatter.string(from: price as NSNumber)!
    }
    
}
