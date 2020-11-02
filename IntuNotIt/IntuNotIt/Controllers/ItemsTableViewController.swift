//
//  ItemsTableViewController.swift
//  IntuNotIt
//
//  Created by Veldanov, Anton on 10/31/20.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    var arr = ["A","B", "C"]
    var itemsArr = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
   
//        let anonymousFunction = {
//            (fetchList:[Item]) in
//            self.itemsArr = fetchList
//            DispatchQueue.main.async {
//
//                self.tableView.reloadData()
//            }
//
//        }
        
        
//        ItemManager.shared.fetchItems(completion: anonymousFunction)
        

        ItemManager.shared.fetchItems { (result) in
            print(result)
            self.itemsArr = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("BOOM",itemsArr.count)
        return itemsArr.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let item = itemsArr[indexPath.row]
//        print(item.name)
        cell.textLabel?.text = item.name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "items", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ItemViewController
        if let index = tableView.indexPathForSelectedRow{
            destinationVC.selectedItem = itemsArr[index.row]
            
        }
    }
    
    

}



    

