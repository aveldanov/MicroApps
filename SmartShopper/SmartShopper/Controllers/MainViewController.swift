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
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var hoursLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(MainViewController.calculate), for: .touchUpInside)
        
        incomeTextField.inputAccessoryView = calcBtn
        priceTextField.inputAccessoryView = calcBtn
        
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }
    
    @objc func calculate(){
        if let incomeText = incomeTextField.text, let priceText = priceTextField.text {
            // casting to Double
            if let income = Double(incomeText), let price = Double(priceText){
                view.endEditing(true) // disable keyboard
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
                resultLabel.text = "\(Income.getHours(forIncome: income, andPrice: price))"
            }
            
        }



    }
    
    
    
    @IBAction func clearCalcPressed(_ sender: UIButton) {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        incomeTextField.text = ""
        priceTextField.text = ""
    }
    

}

