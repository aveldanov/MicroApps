//
//  Item.swift
//  IntuNotIt
//
//  Created by Veldanov, Anton on 10/31/20.
//

import Foundation

//
//struct Items: Decodable{
//    let items: Item
//
//}



struct Item: Decodable {
   let name: String?
    let id : Int?
//    let owner: [Owner]?
    let `private`: Bool
    let node_id : String
    
}

struct Owner: Decodable {
//    let node_id: String
}



