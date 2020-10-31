//
//  TodoListTableViewController.swift
//  TodoyApp
//
//  Created by Veldanov, Anton on 10/21/20.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController {
    @IBOutlet weak var addButton: UIBarButtonItem!
    var itemArray = [Item]()
    let context =  ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    // loadItems() will be called only after category is selected
    var selectedCategory: CategoryItem?{
        didSet{
            loadItems()
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)  )
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
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
        var textFieled = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {(action) in
            
            let newItem = Item(context: self.context)

            newItem.title = textFieled.text!
            newItem.done = false
            newItem.parentCategory = self.selectedCategory
            self.itemArray.append(newItem)



            self.saveData()


            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type something ... "
            textFieled = alertTextField
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
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil){
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        if let addtionalPredicate = predicate{
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [addtionalPredicate,categoryPredicate])
        }else{
            request.predicate = categoryPredicate
        }


        do{
            itemArray =  try context.fetch(request)
            
        }catch{
            
            print("Error fetching context", error)
        }
        tableView.reloadData()

    }
}



//MARK: - Search Bar Methods

extension TodoListTableViewController: UISearchBarDelegate{
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
      // [cd] -> remove case sesitivity for predicate
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        loadItems(with: request, predicate: predicate)
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
        
    }
    
    
}
