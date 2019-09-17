//
//  EducateViewController.swift
//  BMICalc
//
//  Created by Jon Schack on 6/29/19.
//  Copyright © 2019 Jon Schack. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class EducateViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    var urls = [String]()
    //@IBOutlet weak var urlLabel:UILabel?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: urls[Int.random(in: 0..<3)])
        let request = URLRequest (url: myURL!)
        webView.load(request)
    }
}
