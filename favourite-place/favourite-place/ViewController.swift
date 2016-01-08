//
//  ViewController.swift
//  favourite-place
//
//  Created by Nas@Mac on 29/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moreBtn: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreBtn.layer.cornerRadius = 3.0
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

