//
//  ThirdViewController.swift
//  Assignment4
//
//  Created by  on 11/16/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource  {
    var flag=true
    var delay = ""
    var defaltspeed = ""
    var nam = ""
    var myNewDictArray: [[String:String]] = []
    //var pp=NSUserDefaults.standardUserDefaults()
    @IBOutlet weak var UserName: UITextField!
    var uipdatasrc=[String]()
   
    @IBOutlet weak var addnew: UIButton!
    
    
    @IBOutlet weak var DefaultSpeed: UITextField!
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var SleepingDelay: UITextField!
    
    
    @IBOutlet weak var savingchanges: UIButton!
    
    
    //let prefs = NSUserDefaults.standardUserDefaults()
    
     var itmd = [String: String]()
        var isPresent=false
    
    @IBAction func SaveChanges(sender: AnyObject) {
        
        if(self.DefaultSpeed.text != "" || self.SleepingDelay.text != "")
        {
        
        var indexToDel=0

//        prefs.setValue(UserName.text, forKey: "UserName")
//        prefs.setValue(DefaultSpeed.text, forKey: "DefaultSpeed")
//        prefs.setValue(SleepingDelay.text, forKey: "Delay")
//        prefs.synchronize()
//        let tab1=self.tabBarController?.viewControllers?[0] as! FirstViewController
//        tab1.UserName.text=self.UserName.text
//        tab1.WPM.text=self.DefaultSpeed.text
//        
//       
//        myNewDictArray.insert(["UserName":UserName.text!,"Speed1":"0","Speed2":"0","Speed3":"0","HeighestSpeed":"0","LastUpdated":"0","Delay":SleepingDelay.text!,"NoOfTries":"0","DefaultSpeed":self.DefaultSpeed.text!], atIndex: 0)
//             pp.setObject(myNewDictArray,forKey:"UserInfo")
//            pp.synchronize()
//        
//        
//       
//                uipdatasrc.append(self.UserName.text!)
//        
//
//       picker.reloadAllComponents()
//        
//        
//            self.tabBarController?.selectedIndex=0
        NSUserDefaults.standardUserDefaults().setValue(self.UserName.text, forKey: "UserName")
        NSUserDefaults.standardUserDefaults().setValue(self.DefaultSpeed.text, forKey: "DefaultSpeed")
        NSUserDefaults.standardUserDefaults().setValue(self.SleepingDelay.text, forKey: "Delay")
        NSUserDefaults.standardUserDefaults().synchronize()
        let tab1=self.tabBarController?.viewControllers?[0] as! FirstViewController
                tab1.UserName.text=self.UserName.text
                tab1.WPM.text=self.DefaultSpeed.text
        
        if var UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
        {
            
            for var item in UserInfo
                
            {
                itmd=item
                if item["UserName"] == self.UserName.text
                {
                    itmd["DefaultSpeed"]=self.DefaultSpeed.text
                    itmd["Delay"]=self.SleepingDelay.text
                    UserInfo.removeAtIndex(indexToDel)
                    UserInfo.append(itmd)
                    NSUserDefaults.standardUserDefaults().setObject(UserInfo, forKey: "UserInfo")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    
                }
                indexToDel=indexToDel+1
            }
        }
        
        
        }
        else
        {
            let alertController = UIAlertController(title: "WPM or delay can not be empty", message:
                "Please enter te WPM and delay.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
                    }
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
        self.picker.delegate=self
        self.UserName.delegate=self
        self.DefaultSpeed.delegate=self
        self.SleepingDelay.delegate=self
        self.UserName.becomeFirstResponder()
        self.UserName.userInteractionEnabled=false
        if let un=NSUserDefaults.standardUserDefaults().stringForKey("UserName")
        {
            UserName.text=un
            nam=UserName.text!
        }
        if let ds=NSUserDefaults.standardUserDefaults().stringForKey("DefaultSpeed")
        {
            DefaultSpeed.text=ds
            defaltspeed=DefaultSpeed.text!
        }
        if let d=NSUserDefaults.standardUserDefaults().stringForKey("Delay")
        {
            SleepingDelay.text=d
            delay=SleepingDelay.text!
        }
        
delay=SleepingDelay.text!
        if let UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
        {
             print("The user info at \(UserInfo)")
            myNewDictArray=UserInfo
            
            for item in UserInfo
            {
                uipdatasrc.append(item["UserName"]!)
            
            }
        }
        
     }
    
    
    
//    override func viewWillAppear(animated: Bool) {
//        picker.reloadAllComponents()
//    }
//
    
    override func viewWillAppear(animated: Bool) {
        self.UserName.userInteractionEnabled=false
    }
    
    
    
    //uipickerview
    
    func numberOfComponentsInPickerView(picker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(picker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uipdatasrc.count;
    }
    
    func pickerView(picker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uipdatasrc[row]
    }
    
    //calculating and displaying results
    func pickerView(picker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if let UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
        {
            // print(UserInfo)
            
            for item in UserInfo
            {
                if item["UserName"] == uipdatasrc[row]
                {
                    print("came inside")
                    self.UserName.text = uipdatasrc[row]
                    self.DefaultSpeed.text = item["DefaultSpeed"]
                    self.SleepingDelay.text=item["Delay"]
                }
            }
        }

        NSUserDefaults.standardUserDefaults().setValue(self.UserName.text, forKey: "UserName")
        NSUserDefaults.standardUserDefaults().setValue(self.DefaultSpeed.text, forKey: "DefaultSpeed")
        NSUserDefaults.standardUserDefaults().setValue(self.SleepingDelay.text, forKey: "Delay")
        NSUserDefaults.standardUserDefaults().synchronize()
        let tab1=self.tabBarController?.viewControllers?[0] as! FirstViewController
                tab1.UserName.text=self.UserName.text
                tab1.WPM.text=self.DefaultSpeed.text
        
        
        
        
        
        
        
    }
    
    
    @IBAction func AddNewUser(sender: AnyObject) {
       self.UserName.userInteractionEnabled=true
       // self.savingchanges.hidden=true
       
        
        if (flag == true)
        {
        self.addnew.setTitle("Save", forState: .Normal)
            flag=false
        self.UserName.text=""
        self.DefaultSpeed.text=""
        self.SleepingDelay.text=""
        }
       else
        {
            if(self.UserName.text != "")
            {
            if let UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
            {
                //print("before adding defaults \(UserInfo)")
                myNewDictArray=UserInfo
                
                for item in UserInfo
                {
                    if item["UserName"] == self.UserName.text
                    {
                        isPresent=true
                    }
                }
            }
            
                 if(isPresent == false)
            {
            NSUserDefaults.standardUserDefaults().setValue(UserName.text, forKey: "UserName")
            NSUserDefaults.standardUserDefaults().setValue(DefaultSpeed.text, forKey: "DefaultSpeed")
            NSUserDefaults.standardUserDefaults().setValue(SleepingDelay.text, forKey: "Delay")
            NSUserDefaults.standardUserDefaults().synchronize()
            let tab1=self.tabBarController?.viewControllers?[0] as! FirstViewController
            tab1.UserName.text=self.UserName.text
            tab1.WPM.text=self.DefaultSpeed.text
            
            
            //print("value of dict befor ading \(myNewDictArray)")
                myNewDictArray.insert(["UserName":UserName.text!,"Speed1":"0","Speed2":"0","Speed3":"0","HeighestSpeed":"0","LastUpdated":"0","Delay":SleepingDelay.text!,"NoOfTries":"0","DefaultSpeed":self.DefaultSpeed.text!], atIndex: 0)
            NSUserDefaults.standardUserDefaults().setObject(myNewDictArray,forKey:"UserInfo")
            NSUserDefaults.standardUserDefaults().synchronize()
            
                if let UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
                {
                    //print("Data fter adding \(UserInfo)")
                }
            
            uipdatasrc.append(self.UserName.text!)
            
            
            picker.reloadAllComponents()
            
            
            
            flag=true
            self.addnew.setTitle("Add New User", forState: .Normal)
            }
            else
                 {
                    let alertController = UIAlertController(title: "Invalid User Name", message:
                        "User Name already exists Try another one!! ", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        else
            {
            let alertController = UIAlertController(title: "Text field are empty", message:
            "Please enter te user name .", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
            self.presentViewController(alertController, animated: true, completion: nil)
            self.tabBarController?.selectedIndex=2
            }
        
        }
        
        
       
        
    }
    
    
    
    
    
//    
//if(self.UserName.text != "")
//{
//    }
//    else
//    {
//    let alertController = UIAlertController(title: "Text field are empty", message:
//    "Please enter te user name .", preferredStyle: UIAlertControllerStyle.Alert)
//    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
//    
//    self.presentViewController(alertController, animated: true, completion: nil)
//    self.tabBarController?.selectedIndex=2
//    }


    
    
    
    

  
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
