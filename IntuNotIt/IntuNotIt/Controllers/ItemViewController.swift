//
//  ItemViewController.swift
//  IntuNotIt
//
//  Created by Veldanov, Anton on 10/31/20.
//

import UIKit

class ItemViewController: UIViewController {

    var selectedItem: Item?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var privateLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedItem)
        nameLabel.accessibilityIdentifier = "nameLabel"
        updateUI()
    }
    
    func updateUI(){
        if let id = selectedItem?.id, let priv = selectedItem?.private{
            idLabel.text = "\(id)"
            privateLabel.text = "\(priv)"
            
        }
        nameLabel.text = selectedItem?.name
        
    }

}
