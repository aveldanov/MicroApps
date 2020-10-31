//
//  CategoryTableViewController.swift
//  TodoyApp
//
//  Created by Veldanov, Anton on 10/29/20.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    
    var categoryArr = [CategoryItem]()
    let context =  ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(categoryArr)
        loadCategories()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArr[indexPath.row].name
        
        
        return cell
    }
    
    //MARK: - Table View Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    


    
    // prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC  = segue.destination as! TodoListTableViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            print("BOOM",indexPath)
            destinationVC.selectedCategory = categoryArr[indexPath.row]
        }
    }
    
    
    
    //MARK: - Data Manipulation Methods
    func loadCategories(with request: NSFetchRequest<CategoryItem> = CategoryItem.fetchRequest()){
        do{
            categoryArr = try context.fetch(request)
        }catch{
            print("Error fetching context", error)
        }
        tableView.reloadData()

    }
    
    
    func saveCategories(){
        do{
            try context.save()
        }catch{
            print("Error saving context", error)
        }
        tableView.reloadData()

    }
    
    //MARK: - Add New Categories
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Category" , message: "Please add new category", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
           
            let newCategory = CategoryItem(context: self.context)
            newCategory.name = textField.text!
            self.categoryArr.append(newCategory)
            self.saveCategories()
            
        }
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type something ... "
            textField = alertTextField
        }
        alert.addAction(action)
        self.present(alert, animated: false, completion: nil)
    }
    
}
