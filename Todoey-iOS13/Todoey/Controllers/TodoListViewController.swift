

import UIKit
//import CoreData

class TodoListViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    var itemArray = [Item]()
//    var item: Item?
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
//    let defaults = UserDefaults.standard
    let context =  ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
print(context,"sfvsfgdfg")
 
        
//        print(dataFilePath)
        
//        let newItem1 = Item()
//        newItem1.title = "P"
//        itemArray.append(newItem1)
//
//        let newItem2 = Item()
//        newItem2.title = "N"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "D"
//        itemArray.append(newItem3)
//

        //defaults
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
//            itemArray = items
//        }
            //custom plist called 
        
//        loadItems()
    
    }
    
    //MARK: - TableView DataSource Methods
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        print(itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        }
        
        saveData()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - Add New Items Section
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { [self] (action) in
            //action pressed
            //            print(textFiled.text)
            
//            self.itemArray.append(textFiled.text!)
//            let newItem = Item() // struct -> to CoreData
            

            
            let newItem = Item(context: context)
            
            newItem.title = textFiled.text!
            itemArray.append(newItem)
            
            
//            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            //encoder to create new own plist
            
            
                saveData()
            
            
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type something ... "
            textFiled = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Model Manipulation Methods
    
    func saveData(){
//        let encoder = PropertyListEncoder()
        do{
//            let data = try encoder.encode(itemArray)
//            try data.write(to: dataFilePath!)
            print(context)
            try context.save()
        }catch{
//            print("Error encoding", error)
            print("Error saving context", error)
        }
    }
    
//    func loadItems(){
//
//        if let loadedData = try? Data(contentsOf: dataFilePath!){
//            let decoder = PropertyListDecoder()
//            do{
//                itemArray = try decoder.decode([Item].self, from: loadedData)
//            }catch{
//                print("Error decode", error)
//            }
//        }
//    }
    
    
}

