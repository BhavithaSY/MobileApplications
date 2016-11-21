//
//  ThirdViewController.swift
//  Assignment4
//
//  Created by  on 11/16/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITextFieldDelegate {
    
    var delay = ""
    var defaltspeed = ""
    var nam = ""
    var myNewDictArray: [[String:String]] = []
    var pp=NSUserDefaults.standardUserDefaults()
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
        
        
        //saving users and their details to dic
//        
//        if myNewDictArray == []
//        {
//          myNewDictArray.append(["UserName":UserName.text!,"Speed1":"0","Speed2":"0","Speed3":"0","HeighestSpeed":"0","LastUpdated":"0","Delay":SleepingDelay.text!])
//           // print(myNewDictArray)
//             pp.setObject(myNewDictArray,forKey:"UserInfo")
//            pp.synchronize()
//        }
//        else
//        {
        myNewDictArray.insert(["UserName":UserName.text!,"Speed1":"0","Speed2":"0","Speed3":"0","HeighestSpeed":"0","LastUpdated":"0","Delay":SleepingDelay.text!,"NoOfTries":"0"], atIndex: 0)
//           myNewDictArray.append(["UserName":UserName.text!,"Speed1":"0","Speed2":"0","Speed3":"0","HeighestSpeed":"0","LastUpdated":"0","Delay":SleepingDelay.text!])
            //print(myNewDictArray)
             pp.setObject(myNewDictArray,forKey:"UserInfo")
            pp.synchronize()
       // }
        
      
        
       // print(myNewDictArray)
//        if let UserInfo = NSUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
//        {
//            print(UserInfo)
//            
//            for item in UserInfo
//            {
//                print(item["UserName"])
//            }
//        }
        self.tabBarController?.selectedIndex=0
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        SleepingDelay.resignFirstResponder()
        
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.SleepingDelay
        {
            textField.resignFirstResponder()
        }
        return true
    }

    
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                                                 replacementString string: String) -> Bool {
        var filtered=""
        if(textField==SleepingDelay)
        {
            let inverseSet = NSCharacterSet(charactersInString:"0123456789.").invertedSet
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)
            filtered = components.joinWithSeparator("")
            
        }
        else if(textField==UserName)
        {
            let inverseSet = NSCharacterSet(charactersInString:"0123456789.abcdefghijklenoprstuvwxyz@!#$%^&*").invertedSet
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)
            filtered = components.joinWithSeparator("")
        }
        else{
            let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)
            filtered = components.joinWithSeparator("")

        }
        return string == filtered
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.UserName.delegate=self
        self.DefaultSpeed.delegate=self
        self.SleepingDelay.delegate=self
        self.UserName.becomeFirstResponder()
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
        
        
//        if let UserInfo = pp.arrayForKey("UserInfo") as? [[String: String]]
//        {
//           // print(UserInfo)
//            
////            for item in UserInfo
////            {
////                //print(item["UserName"])
////            }
//        }
        
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
