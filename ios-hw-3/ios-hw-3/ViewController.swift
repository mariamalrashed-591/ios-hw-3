//
//  ViewController.swift
//  ios-hw-3
//
//  Created by Mariam on 9/23/20.
//

import UIKit

class ViewController: UIViewController {

    let backgrounArray = ["blues","purpules","greens","pinks","yellow"]
    var index = 0
    
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func calculateButton(_ sender: Any) {
        let heights = Double(height.text!)!
        let h = heights / 100
        let w = Double(weight.text!)!
        let BMI = w / (h * h)
        let bmiRounded = String (format: "%.2f", BMI)
        bmi.text = String (bmiRounded)
        
        if BMI <= 18.5 {
            self.index = (self.index >= self.backgrounArray.count-1) ? 0 :self.index+1
            self.background.image = UIImage(named: backgrounArray[index])
            (sender as AnyObject).setImage(UIImage(named: backgrounArray[index]), for: .normal)
            status.text = "You are underweight"
            status.textColor = UIColor.black
            bmi.textColor = UIColor.black
            
            
        }
        else if BMI > 18.5 && BMI <= 30.0 {
            self.index = (self.index >= self.backgrounArray.count-1) ? 0 :self.index+1
            self.background.image = UIImage(named: backgrounArray[index])
            (sender as AnyObject).setImage(UIImage(named: backgrounArray[index]), for: .normal)
            status.text = "You are in the normal range"
            status.textColor = UIColor.black
            bmi.textColor = UIColor.black
            
        }
        else if BMI >= 30.1 && BMI <= 40.0 {
            self.index = (self.index >= self.backgrounArray.count-1) ? 0 :self.index+1
            self.background.image = UIImage(named: backgrounArray[index])
            (sender as AnyObject).setImage(UIImage(named: backgrounArray[index]), for: .normal)
            status.text = "You are slightly overweight"
            status.textColor = UIColor.black
            bmi.textColor = UIColor.black
        }
        else  {
            self.index = (self.index >= self.backgrounArray.count-1) ? 0 :self.index+1
            self.background.image = UIImage(named: backgrounArray[index])
            (sender as AnyObject).setImage(UIImage(named: backgrounArray[index]), for: .normal)
            status.text = "You are overweight"
            status.textColor = UIColor.black
            bmi.textColor = UIColor.black
        }
    }
    
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

