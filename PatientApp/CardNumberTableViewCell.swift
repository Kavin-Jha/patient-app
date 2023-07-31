//
//  CardNumberTableViewCell.swift
//  PatientApp
//
//  Created by Kavin Jha on 27/07/23.
//

import UIKit

protocol CardNumberSendMainViewController{
    
    func cardNumberData(text: String)
}

class CardNumberTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var cardNumber: UITextField!
    
    var delegate: CardNumberSendMainViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTextField(textFieldName: cardNumber, customName: "Enter KMC card number")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTextField(textFieldName textField:UITextField, customName Name:String ){
        textField.delegate = self
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.attributedPlaceholder = NSAttributedString(
            string: Name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        delegate?.cardNumberData(text: textField.text!)
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        delegate?.cardNumberData(text: textField.text!)
        
        return true
    }



    
}
