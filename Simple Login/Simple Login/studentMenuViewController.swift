//
//  studentMenuViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 21/03/2020.
//

import UIKit

class studentMenuViewController: UIViewController {

    @IBAction func URL(_ sender: Any) {
        if let url = NSURL(string: "https://stream.liv.ac.uk"){
            UIApplication.shared.openURL(url as URL)
        }
    }
    @IBAction func URLContent(_ sender: Any) {
        if let url = NSURL(string: "https://vital.liv.ac.uk"){
            UIApplication.shared.openURL(url as URL)
        }
        
    }
    
    @IBAction func URLCalender(_ sender: Any) {
        if let url = NSURL(string: "https://vital.liv.ac.uk/webapps/calendar/viewPersonal"){
            UIApplication.shared.openURL(url as URL)
        }
        
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
