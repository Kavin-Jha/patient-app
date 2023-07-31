//
//  SubmitButttonTableViewCell.swift
//  PatientApp
//
//  Created by Kavin Jha on 27/07/23.
//

import UIKit
//import FirebaseDatabase

protocol SubmitButtonDelegate {
    func didSelectOnButton()
}
    

class SubmitButttonTableViewCell: UITableViewCell {
    
//    var ref = DatabaseReference.init()
//    var data: String?
    
     var delegate: SubmitButtonDelegate?
    
//    func data(text: String) {
//        data = text
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  self.ref = Database.database().reference()
        // Initialization code
    }
    
    
    @IBAction func submitalldata(_ sender: Any) {
        
        delegate?.didSelectOnButton()
        //saveFirData()
      
    }
    



        // Configure the view for the selected state
    }
    

