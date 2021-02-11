//
//  postqViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 08/03/2020.
//

import UIKit
import Foundation

class postqViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextField!
    

    let fileurl =  FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!.appendingPathComponent("file.txt")
    
    
    @IBAction func submit(_ sender: Any) {
        var question = textBox.text!

        
        do {
            let fileHandle = try FileHandle(forWritingTo: fileurl)
                fileHandle.seekToEndOfFile()
                fileHandle.write(("\n\(question)").data(using: .utf8)!)
            
                fileHandle.closeFile()

        } catch {
            print("Error writing to file \(error)")
        }

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
