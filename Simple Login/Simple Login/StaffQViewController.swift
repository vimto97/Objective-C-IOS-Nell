//
//  StaffQViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 27/02/2020.
//

import UIKit
var ask1 = [String]()
class StaffQViewController: UIViewController {
    
    
    
    @IBOutlet weak var textboxAn: UITextField!
    @IBAction func submit(_ sender: Any) {
        var question = textboxAn.text!
        
        
        ask1.append(question)
        //print(ask1)
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
