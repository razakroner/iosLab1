//
//  ViewController.swift
//  CDViewer
//
//  Created by Użytkownik Gość on 17.10.2017.
//  Copyright © 2017 agh.edu. All rights reserved.
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
    
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var albumField: UITextField!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var tracksField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var tracksLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    func updateTextFields() {
     
        if let CD = self.data[self.actualIndex] as? [String: Any] {
            DispatchQueue.main.async {
                self.artistField.text = CD["artist"] as? String
                self.genreField.text = CD["genre"] as? String
                self.albumField.text = CD["album"] as? String
                let year = CD["year"] as? Int
                let tracks = CD["tracks"] as? Int
                self.yearField.text = String(year!)
                self.tracksField.text = String(tracks!)
            }
        }
    }
    
    func currentTrackUpdate() {
        DispatchQueue.main.async {
            self.prevButton.isEnabled = true
            self.nextButton.isEnabled = true
            self.tracksLabel.text = "\(self.actualIndex+1) z \(self.maxIndex+1)"
            if(self.actualIndex == self.minIndex) {
                self.prevButton.isEnabled = false
            };
            if(self.actualIndex == self.maxIndex) {
                self.nextButton.isEnabled = false
            }
            self.saveButton.isEnabled = false
        }
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
