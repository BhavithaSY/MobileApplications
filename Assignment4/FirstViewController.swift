//
//  FirstViewController.swift
//  Assignment4
//
//  Created by  on 11/16/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var name:String = String()
    
    
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var WPM: UITextField!
    
    
    @IBAction func StartingAction(sender: AnyObject) {
        
        
        
     
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if name == "" {
            let alertController = UIAlertController(title: "No User Selected", message:
                "Please enter te user name first when navigated to settings.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            self.performSegueWithIdentifier("noName", sender: self)
        } else {
            let alertController = UIAlertController(title: "\(name)", message:
                "Contine as \(name) user. If you want to change user go to settings and change user name", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }

    }


    
    
    @IBOutlet weak var WordToDisplay: UILabel!
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       name = UserName.text!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

