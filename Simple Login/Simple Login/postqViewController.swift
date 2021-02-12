//
//  postqViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 08/03/2020.
//

import UIKit
import Foundation

import FirebaseDatabase

class postqViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextField!
    



    @IBAction func submit(_ sender: Any) {
        let question = textBox.text!

        questionArray.append(question)
        ref.child("questions/postQ").setValue(questionArray)
        createalert(title: "Submitted", message: "Sent to the student portal")
    }
    

    
    
    func createalert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
            self.performSegue(withIdentifier: "mySegueID", sender: nil)
            alert.dismiss(animated: true, completion: nil)
            //self.present(ViewStaffController.init(), animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

}
