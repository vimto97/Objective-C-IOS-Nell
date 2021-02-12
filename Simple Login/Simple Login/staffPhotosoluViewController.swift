//
//  staffPhotosoluViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 01/04/2020.
//

import UIKit

class staffPhotosoluViewController: UIViewController {
    var takenPhoto:UIImage?
    @IBOutlet weak var photo: UIImageView!
    override func viewDidLoad() {
        if let avalibleImage = takenPhoto {
            photo.image = avalibleImage
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
