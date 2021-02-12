//
//  StaffQViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 27/02/2020.
//

import UIKit
var ask1 = ""


import FirebaseDatabase
class StaffQViewController: UIViewController {
    
    
    
    @IBOutlet weak var textboxAn: UITextField!
    @IBAction func submit(_ sender: Any) {
        let question = textboxAn.text!
        ask1 = question
        ask10.append(ask1)
        ref.child("questions/Student").setValue(ask10)
        //childByAutoId().setValue(ask1)
        
           createalert(title: "Submitted", message: "Sent to the student portal")
        }
        


        
        func createalert(title:String, message:String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                
                self.performSegue(withIdentifier: "StaffMenu", sender: nil)
                alert.dismiss(animated: true, completion: nil)
                //self.present(ViewStaffController.init(), animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    



}
