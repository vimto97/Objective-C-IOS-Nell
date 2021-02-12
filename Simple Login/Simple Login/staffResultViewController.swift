//
//  staffResultViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 20/03/2020.
//

import UIKit
import Charts

class staffResultViewController: UIViewController {

    
    @IBOutlet weak var pieView: PieChartView!
    func setupPie(){
            pieView.chartDescription?.enabled = false
            pieView.drawHoleEnabled = true
            pieView.rotationAngle = 0
            pieView.rotationEnabled = false
            pieView.isUserInteractionEnabled = false
            
            var entries: [PieChartDataEntry] = Array()
            entries.append(PieChartDataEntry(value: Double(wrongAnswer), label: "Wrong"))
            entries.append(PieChartDataEntry(value: Double(rightAnswer), label: "Right"))
            
            let chartDataSet = PieChartDataSet(entries: entries, label: "")
            let a1 = NSUIColor(hex: 0xe85664)
            let a2 = NSUIColor(hex: 0x3bd9be)
            chartDataSet.colors = [a1,a2]
            chartDataSet.drawValuesEnabled = false
            pieView.data = PieChartData(dataSet: chartDataSet)
        }

        override func viewDidLoad() {
            
            
            setupPie()
            super.viewDidLoad()

        }

    }
    extension NSUIColor {

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid red component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
    }
