//
//  ViewController.swift
//  BMICalc
//
//  Created by Jon Schack on 6/27/19.
//  Copyright © 2019 Jon Schack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var finalBMI: UILabel!
    @IBOutlet weak var heightVal: UITextField!
    @IBOutlet weak var weightVal: UITextField!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let bmiModel: BMICalcModel = BMICalcModel();
        let h = Double(heightVal.text!)
        let w = Double(weightVal.text!)
        let bmiVal = bmiModel.bmi(height:h!,weight: w!)
        finalBMI.text = String(bmiVal)
        message.text = bmiModel.message(bmi: bmiVal)
        if (bmiVal < 18) {
            message.textColor = UIColor.blue
        }
        else if (bmiVal >= 18 && bmiVal < 25) {
            message.textColor = UIColor.green
        }
        else if (bmiVal >= 25 && bmiVal <= 30) {
            message.textColor = UIColor.purple
        }
        else if (bmiVal > 30) {
            message.textColor = UIColor.red
        }
    }
}

