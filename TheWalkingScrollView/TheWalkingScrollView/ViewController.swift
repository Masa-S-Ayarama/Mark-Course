//
//  ViewController.swift
//  TheWalkingScrollView
//
//  Created by Nas@Mac on 1/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    let WIDTH: CGFloat = 262
    let HEIGHT: CGFloat = 378
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var x = 1; x <= 5; x++ {
            let img = UIImage(named: "\(x)")
            let imgView = UIImageView(image: img)
            
            scrollView.addSubview(imgView)
            
            //-WIDTH + (WIDTH * CGFloat(x))
            // add each item on the right hand side of each character on scrollView
            imgView.frame = CGRectMake(-(view.frame.size.width/2 + (WIDTH/2)) + (WIDTH * CGFloat(x)) , 300, WIDTH, HEIGHT)
        }
        
        scrollView.contentSize = CGSizeMake(WIDTH * 5, scrollView.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

