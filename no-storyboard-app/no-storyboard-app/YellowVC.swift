//
//  YellowVCViewController.swift
//  no-storyboard-app
//
//  Created by Nas@Mac on 29/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import UIKit

class YellowVC: UIViewController {
    
    @IBOutlet weak var printLbl: UILabel!
    var receivedText = ""
    
    convenience init(someText: String?) {
        self.init(nibName: "YellowVC", bundle: nil)
        if let str = someText {
            receivedText = str
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        printLbl.text = receivedText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadBlueView(sender: AnyObject) {
        let blueVC = BlueVC(someText: "This is message from Yellow")
        self.presentViewController(blueVC, animated: true, completion: nil)
    }
    
    @IBAction func loadRedView(sender: AnyObject) {
        let redVC = RedVC(someText: "This is message from Yellow")
        self.presentViewController(redVC, animated: true, completion: nil)
    }
    
    

}
