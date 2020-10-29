//
//  CategoryTableViewController.swift
//  TodoyApp
//
//  Created by Veldanov, Anton on 10/29/20.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    
    var categoryArr = [Category]()
    let context =  ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryArr.count
    }
    
    
    //MARK: - Data Manipulation Methods

    
    
    //MARK: - Add New Categories
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
}
//MARK: - Table View Delegate Methods
