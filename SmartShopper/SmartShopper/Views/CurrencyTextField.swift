//
//  CurrencyTextField.swift
//  SmartShopper
//
//  Created by Veldanov, Anton on 9/22/20.
//

import UIKit

@IBDesignable //updates class in the interface builder so you can see changes without running the code

class CurrencyTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20 // deffining CGFloat as it defaults to Double
        let currencyLbl = UILabel(frame: CGRect(x: 5, y: frame.size.height / 2 - size / 2, width: size, height: size))
        currencyLbl.backgroundColor =  #colorLiteral(red: 0.8701437116, green: 0.8649715781, blue: 0.8741197586, alpha: 0.8)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLbl.layer.cornerRadius = 5.0
        currencyLbl.clipsToBounds = true
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current // sets to current location of device - US->$
        currencyLbl.text = formatter.currencySymbol
        addSubview(currencyLbl)
    }
    
    
    
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    @IBInspectable // shows radius in storyboard
    public var radius: CGFloat = 5.0
    
    func customizeView(){
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
        layer.cornerRadius = radius
        textAlignment = .center
        clipsToBounds = true
        
        if let unwrappedPlaceholder = placeholder {
            let attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ]
            let place = NSAttributedString(string: unwrappedPlaceholder, attributes: attributes)
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    
    
}
