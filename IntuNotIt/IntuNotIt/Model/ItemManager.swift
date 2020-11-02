//
//  ItemManager.swift
//  IntuNotIt
//
//  Created by Veldanov, Anton on 10/31/20.
//

import Foundation

class ItemManager{
    //data paginaition
    var fromIndex = 0
    let batchSize = 20
    
    
    let urlFeed = "https://api.github.com/users/intuit/repos"
    static let shared = ItemManager()
    func fetchItems(completion: @escaping ([Item])->()){
        guard let url = URL(string: urlFeed) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            
            guard let data = data else{
                print("data is nil")
                return
            }
            let dataString = String(data: data, encoding: .utf8)
                            print(dataString)
            let decoder = JSONDecoder()
            do{
                guard let itemList = try? JSONDecoder().decode([Item].self, from: data) else{
                    print("Json decoder error")
                    return
                }
                print(itemList)

                completion(itemList)
            }
            
            
        }.resume()
        
        
    }
    
    
}


/*
 
 func performRequest(completion: @escaping (Result<[Item], Error>) -> Void){
 
 guard let url = URL(string: urlFeed) else {return}
 
 let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
 
 if let error = error{
 completion(.failure(error))
 print("DataTask Error")
 }
 guard let response = response else{
 print("response error")
 return
 }
 
 guard let data = data else {
 print("data error")
 return
 }
 
 var jsonData: [Item]?
 do{
 let decoder = JSONDecoder()
 let dataString = String(data: data, encoding: .utf8)
 //                print(dataString)
 jsonData = try decoder.decode([Item].self, from: data)
 //                print(jsonData)
 DispatchQueue.main.async {
 completion(.success(jsonData!))
 }
 
 }catch let error{
 completion(.failure(error))
 }
 
 
 
 
 
 }
 
 dataTask.resume()
 
 }
 
 
 
 */
