//
//  ViewController.swift
//  SmartShopper
//
//  Created by Veldanov, Anton on 9/22/20.
//
import UIKit

class MainViewController: UIViewController {

    
    
    @IBOutlet weak var incomeTextField: CurrencyTextField!
    
    @IBOutlet weak var priceTextField: CurrencyTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(MainViewController.calculate), for: .touchUpInside)
        
        incomeTextField.inputAccessoryView = calcBtn
        priceTextField.inputAccessoryView = calcBtn
    }
    
    @objc func calculate(){
        
    }


}

