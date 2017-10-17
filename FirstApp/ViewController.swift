//
//  ViewController.swift
//  FirstApp
//
//  Created by Razalon on 16/10/2017.
//  Copyright © 2017 wojgas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data: [Any] = []
    var actualIndex: Int = 0
    var minIndex: Int = 0
    var maxIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func getData(){
        let urlString = URL(string: "https://isebi.net/albums.php")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let usableData = data {
                        self.data = try! JSONSerialization.jsonObject(with: usableData, options: []) as! [Any];
                        self.maxIndex = self.data.endIndex-1
                        self.updateTextFields()
                        self.currentTrackUpdate()
                    }
                }
            }
            task.resume()
        }
    }}

