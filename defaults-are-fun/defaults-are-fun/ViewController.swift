//
//  ViewController.swift
//  defaults-are-fun
//
//  Created by Nas@Mac on 1/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favLabel: UILabel!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("Color") as? String {
            favLabel.text = "Favourite Color: \(color)"
            //favLabel.backgroundColor = UIColor.redColor()
        } else {
            favLabel.text = "Pick a color!"
        }
        
        // save custom class's data with NSUserDefaults need to subclass from 'NSObject' and  'NSCoding' protocol to 'encode' and 'decode'
        var personA = Person(first: "Masa", last: "Pancht")
        var personB = Person(first: "Pia", last: "Sawet")
        var personC = Person(first: "Martin", last: "Biber")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        // convert people array to NSData
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        // set key,value to encode data for save
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()  //save data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func red(sender: AnyObject) {
        favLabel.text = "Favourite Color: Red"
        favLabel.backgroundColor = UIColor.redColor()
        NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "Color")
        NSUserDefaults.standardUserDefaults().setValue("redBG", forKey: "BackGround")
        NSUserDefaults.standardUserDefaults().synchronize() //save to disk
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
    }

    @IBAction func yelllow(sender: AnyObject) {
        favLabel.text = "Favourite Color: Yellow"
        favLabel.backgroundColor = UIColor.yellowColor()
        NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "Color")
        NSUserDefaults.standardUserDefaults().setValue("yellowBG", forKey: "BackGround")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func blue(sender: AnyObject) {
        favLabel.text = "Favourite Color: Blue"
        favLabel.backgroundColor = UIColor.blueColor()
        NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "Color")
        NSUserDefaults.standardUserDefaults().setValue("blueBG", forKey: "BackGround")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

