//
//  ThirdViewController.swift
//  Assignment4
//
//  Created by  on 11/16/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var delay = ""
    var defaltspeed = ""
    var nam = ""
    var myNewDictArray: [[String:String]] = []
    @IBOutlet weak var UserName: UITextField!
    
    
    @IBOutlet weak var DefaultSpeed: UITextField!
    
    
    
    @IBOutlet weak var SleepingDelay: UITextField!
    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBAction func SaveChanges(sender: AnyObject) {
        
        
        prefs.setValue(UserName.text, forKey: "UserName")
        prefs.setValue(DefaultSpeed.text, forKey: "DefaultSpeed")
        prefs.setValue(SleepingDelay.text, forKey: "Delay")
        prefs.synchronize()
        let tab1=self.tabBarController?.viewControllers?[0] as! FirstViewController
tab1.UserName.text=self.UserName.text
        tab1.WPM.text=self.DefaultSpeed.text
        self.tabBarController?.selectedIndex=0
        
        //saving users and their details to dic
        
        if myNewDictArray == []
        {
            
        }
        else
        {
            
        }
        
        
        
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let un=prefs.stringForKey("UserName")
        {
            UserName.text=un
            nam=UserName.text!
        }
        if let ds=prefs.stringForKey("DefaultSpeed")
        {
            DefaultSpeed.text=ds
            defaltspeed=DefaultSpeed.text!
        }
        if let d=prefs.stringForKey("Delay")
        {
            SleepingDelay.text=d
            delay=SleepingDelay.text!
        }
        
delay=SleepingDelay.text!
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
