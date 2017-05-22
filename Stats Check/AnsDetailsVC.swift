//
//  AnsDetailsVC.swift
//  Stats Check
//
//  Created by Siddhesh Mhatre on 06/05/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

class AnsDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var ansTableView: UITableView!
    let questionAnsArray = [
        ["Q" : "Welcome, \n\nWhat is (void*)0?", "I" : "NO", "0": "Representation of NULL pointer", "1": "Representation of void pointer", "2": "Error", "3": "None of above", "Ans": "0"],
        
        ["Q" : "Welcome, \n\nCan you combine the following two statements into one? \n char *p; \n p = (char*) malloc(100);", "I" : "NO", "0": "char p = *malloc(100);", "1": "char *p = (char) malloc(100);", "2": "char *p = (char*)malloc(100);", "3": "char *p = (char *)(malloc*)(100);", "Ans": "2"],
        
        ["Q" : "Welcome, \n\nIn which header file is the NULL macro defined?", "I" : "NO", "0": "stdio.h", "1": "stddef.h", "2": "stdio.h and stddef.h", "3": "math.h", "Ans": "2"],
        
        ["Q" : "Welcome, \n\nHow many bytes are occupied by near, far and huge pointers (DOS)?", "I" : "NO", "0": "near=2 far=4 huge=4", "1": "near=4 far=8 huge=8", "2": "near=2 far=4 huge=8", "3": "near=4 far=4 huge=8", "Ans": "1"],
        
        ["Q" : "Welcome, \n\nYou have 10 users plugged into a hub running 10Mbps half-duplex. There is a server connected to the switch running 10Mbps half-duplex as well. How much bandwidth does each host have to the server?", "I" : "NO", "0": "100 kbps", "1": "1 Mbps", "2": "2 Mbps", "3": "10 Mbps", "Ans": "3"]
        
        ]
    var dict : [String:String] = [:]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let preferences = UserDefaults.standard
        if preferences.object(forKey: "questionNum") == nil {
            dict = questionAnsArray[0]
        } else {
            print("\(preferences.integer(forKey: "questionNum"))")
            let num = preferences.integer(forKey: "questionNum")
            dict = questionAnsArray[num]
            
        }
        
//        if dict["I"] == "NO"
//        {
//            return 2
//        }
//        else{
//            return 3
//        }
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! DetailAnsCell
        
        if indexPath.row == 0 {
            cell.detailTextView.text = dict["Q"]!
            return cell
            
        }
        if dict["I"] == "YES" && indexPath.row == 1 {
            cell.detailTextView.text = dict["Q"]!
            return cell
            
        }
        if indexPath.row == 2{
            cell.detailTextView.text = "Options :"
            return cell
        }
        if indexPath.row >= 3 || indexPath.row <= 6 {
            cell.detailTextView.text = "Option \(indexPath.row-3): \(dict[String(indexPath.row-3)])"
            print("\(dict[String(indexPath.row-3)])")
            
        }
        if indexPath.row == 7
        {
            cell.detailTextView.text = "Answer is :"
             cell.detailTextView.textColor = UIColor.green
        }
        if indexPath.row == 8
        {
            cell.detailTextView.text = "Option \(dict["Ans"]!) : \(dict[dict["Ans"]!]!)"
            cell.detailTextView.textColor = UIColor.green
        }

        return cell

    }
    
    // Anto resize TableView Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}


class DetailAnsCell: UITableViewCell {
    
    @IBOutlet weak var detailTextView: UITextView!
}
