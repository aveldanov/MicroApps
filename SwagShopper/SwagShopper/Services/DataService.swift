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
        Category(title: "shirts", imageName: "shirts.png"),
        Category(title: "hoodies", imageName: "hoodies.png"),
        Category(title: "hats", imageName: "hats.png"),
        Category(title: "digital", imageName: "digital.png")
    ]
    
    private let hats = [
        Product(title: "hat1", imageName: "hat01.png", price: "$18"),
        Product(title: "hat2", imageName: "hat02.png", price: "$22"),
        Product(title: "hat3", imageName: "hat03.png", price: "$40"),
        Product(title: "hat4", imageName: "hat04.png", price: "$20")
    ]
    
    private let hoodies = [
        Product(title: "hoodie1", imageName: "hoodie01.png", price: "$31"),
        Product(title: "hoodie2", imageName: "hoodie02.png", price: "$32"),
        Product(title: "hoodie3", imageName: "hoodie03.png", price: "$33"),
        Product(title: "hoodie4", imageName: "hoodie04.png", price: "$34")
    ]
    
    private let shirts = [
        Product(title: "shirt1", imageName: "shirt01.png", price: "$11"),
        Product(title: "shirt2", imageName: "shirt02.png", price: "$12"),
        Product(title: "shirt3", imageName: "shirt03.png", price: "$13"),
        Product(title: "shirt4", imageName: "shirt04.png", price: "$14"),
        Product(title: "shirt5", imageName: "shirt05.png", price: "$15")

    ]
    
    
    private let digitalGoods = [Product]()
    
    
    
    func getCategories()->[Category]{
        return categories
    }
    
    
    func getProducts(forCatgoryTitle title:String) -> [Product]{
        switch title {
        case "shirts":
            return getShirts()
        case "hoodies":
            return getHoodies()
        case "hats":
            return getHats()
        case "digital":
            return getDigitalGoods()
        default:
            return getShirts()
        }
        
    }
    
    
    func getHats()->[Product]{
        return hats
    }
    func getHoodies()->[Product]{
        return hoodies
    }
    func getShirts()->[Product]{
        return shirts
    }
    func getDigitalGoods()->[Product]{
        return digitalGoods
    }
    
    
}
