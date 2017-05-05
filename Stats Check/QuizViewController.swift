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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var questionTableVIew: UITableView!
    
    @IBOutlet weak var answerTableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == questionTableVIew {
            return 2
        }
        else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == questionTableVIew {
            
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell11", for: indexPath) as! QueCell
                cell.questionTextView.text = "Product Hunt surfaces the best new products, every day. It's a place for product-loving enthusiasts to share and geek out about the latest mobile apps, websites, hardware projects, and tech creations.Product Hunt surfaces the best new products, every day."
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell12", for: indexPath)
                return cell
                
            }
            
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell21", for: indexPath) as! AnsCell
            cell.ansTextView.text = "Product Hunt surfaces rgdrgdgdfgdfgdfg dfgdfgdfggdf"
            return cell
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    @IBAction func nextBtnAction(_ sender: UIButton) {
        let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "resultViewController") as? ResultViewController
        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
    }
}

class QueCell: UITableViewCell {
    
    @IBOutlet weak var questionTextView: UITextView!
}



class AnsCell: UITableViewCell {
    
    @IBOutlet weak var radioCheckImage: UIImageView!
    @IBOutlet weak var ansTextView: UITextView!
}
