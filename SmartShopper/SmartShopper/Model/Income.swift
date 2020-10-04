//
//  Income.swift
//  SmartShopper
//
//  Created by Veldanov, Anton on 10/3/20.
//

import Foundation

class Income{
    
    class func getHours(forIncome income: Double, andPrice price: Double)->Int{
//        return Int(ceil(price / income))
        return Int(round(price / income))
    }
    
}
