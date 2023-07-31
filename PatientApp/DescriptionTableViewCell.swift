//
//  DescriptionTableViewCell.swift
//  PatientApp
//
//  Created by Kavin Jha on 28/07/23.
//

import UIKit

protocol descriptionSendMainViewController{
    
    func descriptionData(text: String)
}

class DescriptionTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: descriptionSendMainViewController?
    
    @IBOutlet weak var descriptionField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTextField(textFieldName: descriptionField, customName: "Enter a description of your symptoms")
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        delegate?.descriptionData(text: descriptionField.text!)
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        delegate?.descriptionData(text: descriptionField.text!)
        
        return true
    }
}
