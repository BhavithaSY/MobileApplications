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
    
    let prefs = NSUserDefaults.standardUserDefaults()
    var counterForWords = 0
    var a:[String]=[""]
    var timer=NSTimer()
    
    @IBAction func StartingAction(sender: AnyObject) {
        let tab3=self.tabBarController?.viewControllers?[2] as! ThirdViewController
//tab3.SleepingDelay.text="1"
    print(tab3.delay)
        if(self.UserName.text == "") {
         let alertController = UIAlertController(title: "No User Selected", message:
                            "Please enter te user name first when navigated to settings.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
                        self.presentViewController(alertController, animated: true, completion: nil)
            self.tabBarController?.selectedIndex=2

        }



            
        else {
            prefs.setValue(self.UserName.text, forKey: "UserName")
            prefs.setValue(self.WPM.text, forKey: "WPM")
            prefs.synchronize()
            
            
          //code to access data from file
            //WordToDisplay.text="hello"
            var interval = 60/Double(WPM.text!)!
            
             timer=NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "readFromFile", userInfo: nil, repeats: true)
            
            
            
       

            
            
            
            
            
            
            
            
        }
        
     
        
    }
    
func readFromFile()
{
    if let path =
        NSBundle.mainBundle().pathForResource("TextFile",
                                              ofType: "txt") {
        print(path)
        if let text = try? String(
            contentsOfFile: path,
            encoding: NSUTF8StringEncoding) {
            
             a = text.componentsSeparatedByString(" ")
            print(a.count)
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
                timer.invalidate()
                counterForWords=0
                
            }
            
            
        }
    }

    
    }

    
    
    @IBOutlet weak var WordToDisplay: UILabel!
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tab3=self.tabBarController?.viewControllers?[2] as! ThirdViewController
        if let un=prefs.stringForKey("UserName")
        {
            self.UserName.text=un
        }
        if let sp=prefs.stringForKey("WPM")
        {
            self.WPM.text=sp
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

