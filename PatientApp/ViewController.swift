//
//  ViewController.swift
//  PatientApp
//
//  Created by Kavin Jha on 21/07/23.
//

import UIKit
import Firebase
import Toast

class ViewController: UIViewController, UITextFieldDelegate, NameDataSendMainViewController,CardNumberSendMainViewController, appointmentDateSendMainViewController, descriptionSendMainViewController {
        
    var ref = DatabaseReference.init()
    @IBOutlet weak var formTableView: UITableView!
    
    var fullNametext: String = ""
    var cardNumberText: String = ""
    var appointmentDate: String = ""
    var descriptionText: String = ""
    let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        tableViewSetupParameters()
        self.ref = Database.database().reference()
        //self.navigationController?.navigationBar.barTintColor = UIColor.black
        navigationItem.title = ""
        
    }
    
    func nameData(text: String) {
        self.fullNametext = text
        
    }
    
    func cardNumberData(text: String) {
        self.cardNumberText = text
    }
    
    func appointmentDate(text: String) {
        self.appointmentDate = text
    }
    
    func descriptionData(text: String) {
        self.descriptionText = text
    }
    
    func initializeHideKeyboard(){
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(
     target: self,
     action: #selector(dismissMyKeyboard))
     view.addGestureRecognizer(tap)
     }
    
    @objc func dismissMyKeyboard(){

    view.endEditing(true)
    }
    
    func tableViewSetupParameters(){
        formTableView.estimatedRowHeight = 50
        formTableView.rowHeight = UITableView.automaticDimension
        formTableView.backgroundColor = .white
        formTableView.register(UINib(nibName: "FullNameTableViewCell", bundle: nil), forCellReuseIdentifier: "FullNameTableViewCell")
        formTableView.register(UINib(nibName: "CardNumberTableViewCell", bundle: nil), forCellReuseIdentifier: "CardNumberTableViewCell")
        formTableView.register(UINib(nibName: "SubmitButttonTableViewCell", bundle: nil), forCellReuseIdentifier: "SubmitButttonTableViewCell")
        formTableView.register(UINib(nibName: "AppointmentDateTableViewCell", bundle: nil), forCellReuseIdentifier: "AppointmentDateTableViewCell")
        formTableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        
    }
    
    }




extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        formTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell : FullNameTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "FullNameTableViewCell") as? FullNameTableViewCell
            cell?.delegate = self
            return cell!
        }
        
        else if indexPath.row == 1 {
            
            let cell : CardNumberTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CardNumberTableViewCell") as? CardNumberTableViewCell
            cell?.delegate = self
            return cell!
        }
        
        else if indexPath.row == 2 {
            
            let cell : AppointmentDateTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "AppointmentDateTableViewCell") as? AppointmentDateTableViewCell
            cell?.delegate = self
            return cell!
            
        }
        
        else if indexPath.row == 3 {
            
            let cell : DescriptionTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as? DescriptionTableViewCell
            cell?.delegate = self
            return cell!
        }
        
        else if indexPath.row == 4 {
            
            let cell : SubmitButttonTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "SubmitButttonTableViewCell") as? SubmitButttonTableViewCell
            cell?.delegate = self
            return cell!
        }
        return UITableViewCell()
    }
    
    func vaidateAllFields() -> Bool {
        
        if (fullNametext.isEmpty || cardNumberText.isEmpty || appointmentDate.isEmpty || descriptionText.isEmpty){
            
            return false
        }
        else {
            
            return true
            
        }
    }
    

}
    extension ViewController: SubmitButtonDelegate {
        func didSelectOnButton() {
            
            if vaidateAllFields() {
                let dict = ["name" : fullNametext, "cardNumber" : cardNumberText, "AppointmentDate" : appointmentDate, "Description" : descriptionText]
                self.ref.child("PatientInfo").childByAutoId().setValue(dict)
                let navController = self.mainStoryboard.instantiateViewController(withIdentifier: "ThankyYouController")
                let navigationController = UINavigationController(rootViewController: navController)
                //                self.present(navController, animated: true)
                
                UIApplication.shared.keyWindow?.rootViewController = navigationController
        }
            else {
                self.view.makeToast("Please fill in all fields", duration: 3, position: CSToastPositionBottom)
            }
    }
        
}
