//
//  FullNameTableViewCell.swift
//  PatientApp
//
//  Created by Kavin Jha on 26/07/23.
//

import UIKit

protocol NameDataSendMainViewController{
    
    func nameData(text: String)
}

class FullNameTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: NameDataSendMainViewController?
    
    @IBOutlet weak var fullNameTextView: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fullNameTextView.delegate = self
        configureTextField(textFieldName: fullNameTextView, customName: "Enter First Name")
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        delegate?.nameData(text: textField.text!)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        delegate?.nameData(text: textField.text!) 
        textField.resignFirstResponder()
        return true
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
    

    
}


