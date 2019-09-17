//
//  BMIModel.swift
//  BMICalc
//
//  Created by Jon Schack on 6/27/19.
//  Copyright © 2019 Jon Schack. All rights reserved.
//

import Foundation

class BMICalcModel {
    
    func bmi(height:Double, weight:Double)->Double {
        return (weight/(height*height))*703
    }
    
    func message(bmi: Double)->String {
        if (bmi < 18) {
            return "You are underweight!"
        }
        else if (bmi >= 18 && bmi < 25) {
            return "You are normal!"
        }
        else if (bmi >= 25 && bmi <= 30) {
            return "You are pre-obese!"
        }
        else if (bmi > 30) {
            return "You are obese!"
        }
        else {
            return "Invalid entry!"
        
        }
    }
}
