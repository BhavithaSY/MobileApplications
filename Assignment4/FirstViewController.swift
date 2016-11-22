//
//  FirstViewController.swift
//  Assignment4
//
//  Created by  on 11/16/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,UITextFieldDelegate{
    var name:String = String()
    
    
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var WPM: UITextField!
    
    //let prefs = NSUserDefaults.standardUserDefaults()
    var counterForWords = 0
    var a:[String]=[""]
    var timer:NSTimer?
    var itmd = [String: String]()
    var indexToDel:Int=0
    
    @IBAction func StartingAction(sender: AnyObject) {
        indexToDel = 0
        let tab3=self.tabBarController?.viewControllers?[2] as! ThirdViewController
        if(self.UserName.text == "") {
         let alertController = UIAlertController(title: "No User Selected", message:
                            "Please enter te user name first when navigated to settings.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
                        self.presentViewController(alertController, animated: true, completion: nil)
            self.tabBarController?.selectedIndex=2

        }



            
        else {
            if(self.WPM.text != "")
            {
            
            
            NSUserDefaults.standardUserDefaults().setValue(self.UserName.text, forKey: "UserName")
            NSUserDefaults.standardUserDefaults().setValue(self.WPM.text, forKey: "WPM")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            
            
            
            //storing in dictionary////
            if var UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
            {
                //print(UserInfo)
                
                for var item in UserInfo
                    
                {
                    
                    itmd=item
                    //print(item["UserName"])
                    
                    var waitTime=UInt32(item["Delay"]!)
                    sleep(waitTime!)
                    
                    if(item["UserName"] == self.UserName.text)
                    {
                       // print("Entered")
                       if(item["Speed1"]! == "0")
                       {
                        //print("Entered1")
                        itmd["Speed1"] = WPM.text
                        itmd["LastUpdated"]="Speed1"
                        itmd["HeighestSpeed"]=WPM.text!
                       var temptries = Int(item["NoOfTries"]!)
                        itmd["NoOfTries"]=String(temptries!+1)
                        
                        //print(itmd)
                        
                        UserInfo.removeAtIndex(indexToDel)
                        UserInfo.append(itmd)
                        //print(UserInfo)
                        NSUserDefaults.standardUserDefaults().setObject(UserInfo, forKey: "UserInfo")
                        
                        NSUserDefaults.standardUserDefaults().synchronize()
                       // print(item["Speed1"])

                        //itmd["Speed1"] = WPM.text
                        }
                        else if (item["Speed2"] == "0")
                       {
                        itmd["Speed2"]=WPM.text
                        itmd["LastUpdated"]="Speed2"
                        var speed1=item["Speed1"]
                        var hs:String=""
                        if(speed1>WPM.text)
                        {
                            itmd["HeighestSpeed"]=speed1
                        }
                        else
                        {
                            itmd["HeighestSpeed"]=WPM.text!
                        }
                        var temptries = Int(item["NoOfTries"]!)
                        itmd["NoOfTries"]=String(temptries!+1)

                        UserInfo.removeAtIndex(indexToDel)
                        UserInfo.append(itmd)
                        //print(UserInfo)
                        
                        
                        NSUserDefaults.standardUserDefaults().setObject(UserInfo , forKey: "UserInfo")
                        NSUserDefaults.standardUserDefaults().synchronize()

                        //itmd["Speed2"] = WPM.text
                        }
                        else if (item["Speed3"] == "0")
                       {
                        itmd["Speed3"]=WPM.text
                        itmd["LastUpdated"]="Speed3"
                        var speed1=Int(item["Speed1"]!)!
                        var speed2=Int(item["Speed2"]!)!
                        var nw=Int(WPM.text!)!
                        var ths=[Int]()
                        ths.append(speed1)
                        ths.append(speed2)
                        ths.append(nw)
                        itmd["HeighestSpeed"]=String(ths.maxElement()!)
                        var temptries = Int(item["NoOfTries"]!)
                        itmd["NoOfTries"]=String(temptries!+1)

                        UserInfo.removeAtIndex(indexToDel)
                        UserInfo.append(itmd)
                        
                     
                        
                        
                        
                        
                        
                        
                        
                       // print(UserInfo)

                        NSUserDefaults.standardUserDefaults().setObject(UserInfo, forKey: "UserInfo")
                        NSUserDefaults.standardUserDefaults().synchronize()

                        //itmd["Speed3"] = WPM.text
                        }
                        else
                       {
                        //condition to check all and insert
                        
                        var speed1=item["Speed1"]
                        var speed2=item["Speed2"]
                        var speed3=item["Speed3"]
                        var high=item["HeighestSpeed"]
                        var lup=item["LastUpdated"]
                        var lastToUpdate:String=""
                        if(lup=="Speed1")
                        {
                            lastToUpdate="Speed2"
                        }
                        else if(lup=="Speed2")
                        {
                            lastToUpdate="Speed3"
                        }
                        else
                        {
                            lastToUpdate="Speed1"
                        }
                        
                        itmd[lastToUpdate]=WPM.text
                        itmd["LastUpdated"]=lastToUpdate
                        var speed11=Int(item["Speed1"]!)!
                        var speed22=Int(item["Speed2"]!)!
                        var speed33=Int(item["Speed3"]!)!
                        var ht=Int(item["HeighestSpeed"]!)!
                        var nw=Int(WPM.text!)!
                        var ths=[Int]()
                        ths.append(speed11)
                        ths.append(speed22)
                        ths.append(speed33)
                        ths.append(ht)
                        ths.append(nw)
                        itmd["HeighestSpeed"]=String(ths.maxElement()!)
                        var temptries = Int(item["NoOfTries"]!)
                        itmd["NoOfTries"]=String(temptries!+1)

                        UserInfo.removeAtIndex(indexToDel)
                        UserInfo.append(itmd)
                        //print(UserInfo)
                        
                        NSUserDefaults.standardUserDefaults().setObject(UserInfo, forKey: "UserInfo")
                        NSUserDefaults.standardUserDefaults().synchronize()

                       // itmd["Speed1"] = WPM.text
                        }
                    }
                  indexToDel=indexToDel+1
                }
                
            }
            //simply displayig to check
            
            if let UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
            {
                //print(UserInfo)
                
//                for item in UserInfo
//                {
//                    print(item)
//                }
            }

           
            
            
          //code to access data from file
            //WordToDisplay.text="hello"
            var interval = 60/Double(WPM.text!)!
            if timer == nil
            {
            
             timer=NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "readFromFile", userInfo: nil, repeats: true)
            
            
            }
       

            
            
            
            
            
            
            }
            else
            {
                let alertController = UIAlertController(title: "No wpm", message:
                    "Please enter te wpm.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
        }
        
     
        
    }
    
func readFromFile()
{
    if let path =
        NSBundle.mainBundle().pathForResource("TextFile",
                                              ofType: "txt") {
       // print(path)
        if let text = try? String(
            contentsOfFile: path,
            encoding: NSUTF8StringEncoding) {
            
             a = text.componentsSeparatedByString(" ")
            //print(a.count)
            if(counterForWords<a.count)
            {
                
                let myMutableString=NSMutableAttributedString(string:a[counterForWords])
                //change color attribute
                var copl=round(Double(a[counterForWords].characters.count/2))
                myMutableString.addAttribute(NSForegroundColorAttributeName,value:UIColor.greenColor(),range: NSRange(location: Int(copl),length: 1))

                
                
                
                

                WordToDisplay.attributedText=myMutableString
                counterForWords=counterForWords+1
            }
            else {
                if timer != nil
                {
                timer!.invalidate()
                   timer = nil
                }
                counterForWords=0
                
            }
            
            
        }
    }

    
    }

    
    
    @IBOutlet weak var WordToDisplay: UILabel!
    
    
    
    @IBAction func Stopping(sender: AnyObject) {
        if timer != nil
        {
            timer!.invalidate()
            timer = nil
        }

        counterForWords=0
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.WPM
        {
            textField.resignFirstResponder()
        }
        return true
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        WPM.resignFirstResponder()
        self.view.endEditing(true)
    }

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.WPM.delegate=self
        WPM.becomeFirstResponder()
        
        let tab3=self.tabBarController?.viewControllers?[2] as! ThirdViewController
        if let un=NSUserDefaults.standardUserDefaults().stringForKey("UserName")
        {
            self.UserName.text=un
        }
        if let sp=NSUserDefaults.standardUserDefaults().stringForKey("WPM")
        {
            self.WPM.text=sp
        }
        
        //simply displayig to check
        
//        if let UserInfo = tab3.pp.arrayForKey("UserInfo") as? [[String: String]]
//        {
//            print(UserInfo)
//            
////            for item in UserInfo
////            {
////                print(item)
////            }
//        }

       
    }
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                                                 replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        let filtered = components.joinWithSeparator("")
        return string == filtered
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

