//
//  touchfilequestion.swift
//  Simple Login
//
//  Created by Vimal Solanki on 17/03/2020.
//

import UIKit
import Firebase
var screenshot:UIImage!
class Canvas: UIView{
    override func draw(_ rect: CGRect) {
        //custom drawinglet screenshot
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        context.setStrokeColor(UIColor.blue.cgColor)
        
        lines.forEach{(line) in
        
            for (i, p) in line.enumerated(){
                if i == 0{
                    context.move(to: p)
                }else{
                    context.addLine(to: p)
                    
                }
            }
        }
        
        context.strokePath()
        
    }
    
    
    
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        //print(point)
        
        guard var lastLine = lines.popLast() else {
            return
        }
        lastLine.append(point)
        lines.append(lastLine)

        
        setNeedsDisplay()
    }

    
    
}

class touchfilequestion: UIViewController {


    
    let canvas = Canvas()
    

        

        
        
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

        view.addSubview(canvas)
        canvas.frame = view.frame
        canvas.backgroundColor = .white
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        screenShotMethod()
    }
    
    
    func screenShotMethod()->UIImage
    {
        let layer = self.view.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);

        layer.render(in: UIGraphicsGetCurrentContext()!)
        screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return screenshot!
//        if let image = screenshot {
//        if let data = image.pngData() {
//            FirebaseStorageManager().uploadImageData(data: data, serverFileName: "your_server_file_name.png") { (isSuccess, url) in
//                        print("uploadImageData: \(isSuccess), \(url)")
//                  }
//
//        }
//        }
    }
}
