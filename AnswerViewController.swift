//
//  AnswerViewController.swift
//  Stats Check
//
//  Created by Siddhesh Mhatre on 30/04/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController, UITextViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! DetailAnsCell
        cell.detailTextView.text = "afshfkjsd.kfs fsdfsdgf;sd fsdfgsdkfgds dsfgsdkgfskdf sdfdskfsdfs fsdfsdhfhsdlh"
        
        return cell
    }
    
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

class QueImageCell: UITableViewCell {
    
    @IBOutlet weak var queImage: UIImageView!
}
