//
//  DataService.swift
//  SwagShopper
//
//  Created by Veldanov, Anton on 10/9/20.
//

import Foundation

class DataService{
    static let instance = DataService() // singleton
    
    private let categories = [
        Category(title: "Shirts", imageName: "shirts.png"),
        Category(title: "Hoodies", imageName: "hoodies.png"),
        Category(title: "Hats", imageName: "hats.png"),
        Category(title: "Digital", imageName: "digital.png")
    ]
    
    
    func getCategories()->[Category]{
        
        
        return categories
    }
}
