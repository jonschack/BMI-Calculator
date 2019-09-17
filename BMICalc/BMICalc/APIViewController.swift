//
//  APIViewController.swift
//  BMICalc
//
//  Created by Jon Schack on 6/28/19.
//  Copyright © 2019 Jon Schack. All rights reserved.
//

import Foundation
import UIKit

class APIViewController: UIViewController {
    @IBOutlet weak var heightVal: UITextField!
    @IBOutlet weak var weightVal: UITextField!
    @IBOutlet weak var finalBMI: UILabel!
    @IBOutlet weak var message: UILabel!
    
    var more = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    struct bmiResults: Decodable {
        let bmi: Double
        let more: [String]
        let risk: String
    }

    @IBAction func calcBMI(_ sender: Any) {
        let h = heightVal.text!
        let w = weightVal.text!
        //let hw = "?height=\(h)&weight=\(w)"
        let urlAsString = "http://webstrar99.fulton.asu.edu/page3/Service1.svc/calculateBMI?height=\(h)&weight=\(w)"
        
        let url = URL(string: urlAsString)
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url!) { (data, response, error) -> Void in
            
            let decoder = JSONDecoder()
            let jsonResult = try! decoder.decode(bmiResults.self, from: data!)
            let bmiVal = jsonResult.bmi
            self.more = jsonResult.more
            let risk = jsonResult.risk
            
            DispatchQueue.main.async {
                self.finalBMI.text = String(bmiVal)
                self.message.text = risk
                if (bmiVal < 18) {
                    self.message.textColor = UIColor.blue
                }
                else if (bmiVal >= 18 && bmiVal < 25) {
                    self.message.textColor = UIColor.green
                }
                else if (bmiVal >= 25 && bmiVal <= 30) {
                    self.message.textColor = UIColor.purple
                }
                else if (bmiVal > 30) {
                    self.message.textColor = UIColor.red
                }
            }
        }
        jsonQuery.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EducateViewController {
            let vc = segue.destination as! EducateViewController
            vc.urls = more
        }
    }
}
