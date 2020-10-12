//
//  Product.swift
//  SwagShopper
//
//  Created by Veldanov, Anton on 10/11/20.
//

import Foundation

struct Product{
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String

    init(title: String, imageName: String, price: String) {
        self.title = title
        self.imageName = imageName
        self.price = price
    }
    
}
