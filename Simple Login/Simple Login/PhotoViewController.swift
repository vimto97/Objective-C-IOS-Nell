//
//  PhotoViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 27/03/2020.
//

import UIKit
import FirebaseStorage
import Firebase

class PhotoViewController: UIViewController {
    let storage = Storage.storage()
    var takenPhoto:UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func submit(_ sender: Any) {
        let storageRef = storage.reference()
        
        
//        storageRef.putFile(from: takenPhoto, metadata: StorageMetadata?, completion: nil)
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        if let avalibleImage = takenPhoto {
            imageView.image = avalibleImage
        }
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
