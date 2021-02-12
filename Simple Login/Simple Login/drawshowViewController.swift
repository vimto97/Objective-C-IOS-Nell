//
//  drawshowViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 24/03/2020.
//

import UIKit

class drawshowViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let drawin = screenshot{
        imageView.image  = drawin
        }
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
