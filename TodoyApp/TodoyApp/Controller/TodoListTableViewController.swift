//
//  TodoListTableViewController.swift
//  TodoyApp
//
//  Created by Veldanov, Anton on 10/21/20.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var addButton: UIBarButtonItem!
    var itemArray = [Item]()
    let context =  ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)  )
        loadItems()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               
//        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        context.delete(itemArray[indexPath.row])

        itemArray.remove(at: indexPath.row)
        
        saveData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {(action) in
            
            let newItem = Item(context: self.context)

            newItem.title = textFiled.text!
            newItem.done = false
            self.itemArray.append(newItem)



            self.saveData()


            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type something ... "
            textFiled = alertTextField
        }
        alert.addAction(action)
        self.present(alert, animated: false, completion: nil)
        
    }
    
    //MARK: - Model Manipulation Methods
    
    func saveData(){
        do{
            print(context)
            try context.save()
        }catch{
            print("Error saving context", error)
        }
        tableView.reloadData()

    }
    
    func loadItems(){
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do{
            itemArray =  try context.fetch(request)
            
        }catch{
            
            print("Error fetching context", error)
        }
        
    }
}
