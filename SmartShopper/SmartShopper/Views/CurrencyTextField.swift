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
        currencyLbl.backgroundColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.8)
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
        
        if let unwrappedPlaceholder = placeholder {
            let attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ]
            let place = NSAttributedString(string: unwrappedPlaceholder, attributes: attributes)
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    
    
}
