//
//  askQuestionViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 06/03/2020.
//

import UIKit
var ask2 = [String]()
class askQuestionViewController: UIViewController {

    @IBOutlet weak var textbox: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        var question = textbox.text!
        
        ask2.append(question)
        ref.child("questions/Staff").setValue(ask2)
       createalert(title: "Submitted", message: "Sent to Lecturer")
    }
    

    
    
    func createalert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
            self.performSegue(withIdentifier: "backStudentMenu", sender: nil)
            alert.dismiss(animated: true, completion: nil)
            //self.present(ViewStaffController.init(), animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
