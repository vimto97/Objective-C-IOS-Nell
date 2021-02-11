//
//  ViewStaffController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 05/02/2020.
//

import UIKit

class ViewStaffController: UIViewController {

    @IBOutlet weak var usernamebox: UITextField!
    
    
    @IBOutlet weak var passwordbox: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var welcomescreen: UILabel!
    
    @IBOutlet weak var loginbutton: UIButton!
    
    @IBOutlet weak var Qbutton: UIButton!
    
    @IBOutlet weak var Abutton: UIButton!
    
    @IBOutlet weak var postquestion: UIButton!
    @IBAction func login(_ sender: Any) {
        var username = usernamebox.text!
        var password = passwordbox.text!
        
        if password == "admin"{
            usernamebox.isHidden = true
            passwordbox.isHidden = true
            image.isHidden = true
            loginbutton.isHidden = true
            welcomescreen.isHidden = false
            Qbutton.isHidden = false
            Abutton.isHidden = false
            postquestion.isHidden = false
            passwordbox.resignFirstResponder()
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
