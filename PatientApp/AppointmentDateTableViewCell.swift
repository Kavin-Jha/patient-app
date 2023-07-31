//
//  AppointmentDateTableViewCell.swift
//  PatientApp
//
//  Created by Kavin Jha on 28/07/23.
//

import UIKit

protocol appointmentDateSendMainViewController{
    
    func appointmentDate(text: String)
}

class AppointmentDateTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: appointmentDateSendMainViewController?
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var appointmentDateField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureTextField(textFieldName: appointmentDateField, customName: "Enter your preferred appointment date")
        createDatePicker()
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
    
    func createToolBar() -> UIToolbar{
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatePicker(){
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        appointmentDateField.inputView = datePicker
        appointmentDateField.inputAccessoryView = createToolBar()
    }
  
    
    
  @objc func donePressed(){
        let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .medium
      dateFormatter.timeStyle = .none
      self.endEditing(true)
      self.appointmentDateField.text = dateFormatter.string(from: datePicker.date)
      delegate?.appointmentDate(text: appointmentDateField.text!)
      print(self.appointmentDateField.text)

        
    }
}
