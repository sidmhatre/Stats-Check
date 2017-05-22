//
//  QuizViewController.swift
//  Stats Check
//
//  Created by Siddhesh Mhatre on 30/04/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = UserDefaults.standard
        _ = preferences.set(1, forKey: "questionNum")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var questionTableVIew: UITableView!
    
    @IBOutlet weak var answerTableView: UITableView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    var curretAns = [Int]()
    
    let questionAnsArray = [
        ["Q" : "Welcome, \n\nWhat is (void*)0?", "I" : "NO", "0": "Representation of NULL pointer", "1": "Representation of void pointer", "2": "Error", "3": "None of above", "Ans": "0"],
        
        ["Q" : "Welcome, \n\nCan you combine the following two statements into one? \n char *p; \n p = (char*) malloc(100);", "I" : "NO", "0": "char p = *malloc(100);", "1": "char *p = (char) malloc(100);", "2": "char *p = (char*)malloc(100);", "3": "char *p = (char *)(malloc*)(100);", "Ans": "2"],
        
        ["Q" : "Welcome, \n\nIn which header file is the NULL macro defined?", "I" : "NO", "0": "stdio.h", "1": "stddef.h", "2": "stdio.h and stddef.h", "3": "math.h", "Ans": "2"],
        
        ["Q" : "Welcome, \n\nHow many bytes are occupied by near, far and huge pointers (DOS)?", "I" : "NO", "0": "near=2 far=4 huge=4", "1": "near=4 far=8 huge=8", "2": "near=2 far=4 huge=8", "3": "near=4 far=4 huge=8", "Ans": "1"],
        
        ["Q" : "Welcome, \n\nYou have 10 users plugged into a hub running 10Mbps half-duplex. There is a server connected to the switch running 10Mbps half-duplex as well. How much bandwidth does each host have to the server?", "I" : "NO", "0": "100 kbps", "1": "1 Mbps", "2": "2 Mbps", "3": "10 Mbps", "Ans": "3"],
        
        ["Q" : "Welcome, \n\nA logic probe is again applied to the pins of a 7421 IC with the following results. Is there a problem with the circuit and if so, what is the problem?", "I" : "img1", "0": "Pin 6 should be ON.", "1": "Pin 8 should be ON.", "2": "Pin 8 should be pulsing.", "3": "no problem", "Ans": "3"]

        
        
        ]
    
    var dict : [String:String] = [:]
    var quesNum = 0
    var setSelected : Int = -1
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == questionTableVIew {
            dict = questionAnsArray[quesNum]
            if dict["I"] == "NO"
            {
                return 1
            }
            else{
                return 2
            }
        }
        else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Question View
        if tableView == questionTableVIew {
            
            headerLabel.text = " Question \(quesNum+1) of \(questionAnsArray.count)"
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell11", for: indexPath) as! QueCell
                
                cell.questionTextView.text = dict["Q"]!                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell12", for: indexPath) as! QueImageCell
                cell.cellImage.image = UIImage(named: "img1")
                return cell
                
            }
            
        }
        else {
            // Answer View
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell21", for: indexPath) as! AnsCell
            cell.ansTextView.text = dict[String(indexPath.row)]
            cell.backgroundColor = UIColor.white
            cell.ansTextView.backgroundColor = UIColor.white

            if setSelected >= 0 && setSelected == indexPath.row
            {
                cell.backgroundColor = UIColor.green
                cell.ansTextView.backgroundColor = UIColor.green
            }
            return cell
            
        }
        
        
    }
    
    // Anto resize TableView Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Answer Selection color change
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         answerTableView.reloadData()
            if tableView == answerTableView {
                setSelected = indexPath.row
        }
       
    }
    
    // Next Button Click Action
    @IBAction func nextBtnAction(_ sender: UIButton) {
        quesNum += 1
        
        let preferences = UserDefaults.standard
        _ = preferences.set(quesNum, forKey: "questionNum")
        
        if Int(dict["Ans"]!)! == setSelected {
            curretAns.append(setSelected)
        }
        else{
            curretAns.append(-1)
        }
        
        if questionAnsArray.count-1 < quesNum {
            let resultViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "resultViewController") as? ResultViewController
            resultViewControllerObj?.curretAns = curretAns
            self.navigationController?.pushViewController(resultViewControllerObj!, animated: true)
        }
        else{
            setSelected = -1
            questionTableVIew.reloadData()
            answerTableView.reloadData()
            
        }

    }
    
}

class QueCell: UITableViewCell {
    
    @IBOutlet weak var questionTextView: UITextView!
}

class QueImageCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
}


class AnsCell: UITableViewCell {
    
    @IBOutlet weak var radioCheckImage: UIImageView!
    @IBOutlet weak var ansTextView: UITextView!
}
