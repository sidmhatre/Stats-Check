//
//  ResultViewController.swift
//  Stats Check
//
//  Created by Siddhesh Mhatre on 05/05/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var curretAns = [Int]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return curretAns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:indexPath as IndexPath) as! StarCollectionCell
        
        if curretAns[indexPath.row] >= 0 {
            cell.setStarButton.setImage(UIImage(named: "Star-1"), for: .normal)
        }
        else{
            cell.setStarButton.setImage(UIImage(named: "Star-2"), for: .normal)

        }
        return cell
    }

    @IBAction func goToHomeClick(_ sender: UIButton) {
        
        let categoryScreenVCObj = self.storyboard?.instantiateViewController(withIdentifier: "categoryScreenVC") as? CategoryScreenVC
        self.navigationController?.pushViewController(categoryScreenVCObj!, animated: true)
    }


}

class StarCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var setStarButton: UIButton!
}
