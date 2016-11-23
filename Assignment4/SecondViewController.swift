//
//  SecondViewController.swift
//  Assignment4
//
//  Created by  on 11/16/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var LastScore: UILabel!
    
    @IBOutlet weak var LastButOneScore: UILabel!
    
    
    @IBOutlet weak var LastBeforeButOneScore: UILabel!
    
    @IBOutlet weak var NoOfTries: UILabel!
   
    
    @IBOutlet weak var table: UITableView!
    var speeds=[Int]()
    var namess=[String]()
    
    
     func numberOfSectionsInTableView(table: UITableView) -> Int {
        return 1 //one section
    }
     func tableView(table: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return "contacts"
        return "Users:Scores"
    }
     func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        var x = 0
        let tab3=self.tabBarController?.viewControllers?[2] as! ThirdViewController
        if let s1=NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String:String]]
        {
            for item in s1
            {
                x=x+1
            }
        }
        
        //return contacts.count()
        return x
        
    }
    
     func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let contactIdentifier = "cell"
       let cell = table.dequeueReusableCellWithIdentifier(contactIdentifier,forIndexPath: indexPath)
//        let contact = contacts.contactAtIndex(indexPath.row)
//        cell.textLabel!.text=contact.fillName()
//        cell.detailTextLabel!.text="\(contact.email)"
//        cell.imageView!.image=UIImage(named: "mickey.jpeg")
        //way of getting the image dynamically
        // UIImage(named: arrayofpictures[indexPath.row])
       
      cell.textLabel?.text = namess[indexPath.row]
        cell.detailTextLabel?.text=String(speeds[indexPath.row])

//        if let UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
//        {
//            //print(UserInfo)
//            for item in UserInfo
//            {
//                dict["name"]=item["UserName"]
//                dict["speed"]=Int(item["HeighestSpeed"]!)
//                myArray.append(dict)
//            }
//            
//        }
//        print("Before sorting \(myArray)")
//        //let mySortedArray=myArray.sorted{$1["speed"] as? Int > $0["speed"] as? Int}
////        print(mySortedArray)
//        myArray.sort{
//            (($0 ["speed"] as? Int) < ($1["speed"] as? Int))
//        }
//        print(myArray)
//        cell.textLabel?.text=String(myArray[indexPath.row]["name"]!)
//        cell.detailTextLabel?.text=String(myArray[indexPath.row]["speed"]!)

        
       
       return cell
    }

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate=self
        self.table.dataSource=self
        //self.table.reloadData()
         let tab3=self.tabBarController?.viewControllers?[2] as! ThirdViewController
        
        if let un=NSUserDefaults.standardUserDefaults().stringForKey("UserName")
        {
            self.UserName.text = un
        }
        if let s1=NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String:String]]
        {
            for item in s1
            {
                if item["UserName"] == self.UserName.text
                {
                    self.LastScore.text = item["Speed1"]
                    self.LastButOneScore.text=item["Speed2"]
                    self.LastBeforeButOneScore.text=item["Speed3"]
                    self.NoOfTries.text=item["NoOfTries"]
                    break
                }
            }
        }
        //UserName.text=
        // Do any additional setup after loading the view, typically from a nib.
        viewWillAppear(true)
    }

    override func viewWillAppear(animated: Bool) {
        
       super.viewWillAppear(animated)
        var myArray: [[String:String]] = []
        var dict:[String: String] = [:]
        //self.table.reloadData()
        speeds.removeAll()
        namess.removeAll()
        if let UserInfo = NSUserDefaults.standardUserDefaults().arrayForKey("UserInfo") as? [[String: String]]
        {
            //print(UserInfo)
            for item in UserInfo
            {
                dict["name"]=item["UserName"]
                dict["speed"]=item["HeighestSpeed"]
                myArray.append(dict)
            }
            
        }
        for all in myArray
        {
            speeds.append(Int(all["speed"]!)!)
            namess.append(all["name"]!)
            
        }
        var l = 0
        var m=""
        for(var i = 0 ; i < speeds.count ; i++)
        {
            for(var j=i+1;j<speeds.count;j++)
            {
                if speeds[i]<speeds[j]
                {
                    l=speeds[i]
                    speeds[i]=speeds[j]
                    speeds[j]=l
                    m=namess[i]
                    namess[i]=namess[j]
                    namess[j]=m
                }
            }
        }
        let tab3=self.tabBarController?.viewControllers?[2] as! ThirdViewController
        
        if let un=NSUserDefaults.standardUserDefaults().stringForKey("UserName")
        {
            self.UserName.text = un
        }
        if let s1=NSUserDefaults.standardUserDefaults()
            .arrayForKey("UserInfo") as? [[String:String]]
        {
            for item in s1
            {
                if item["UserName"] == self.UserName.text
                {
                    self.LastScore.text = item["Speed1"]
                    self.LastButOneScore.text=item["Speed2"]
                    self.LastBeforeButOneScore.text=item["Speed3"]
                    self.NoOfTries.text=item["NoOfTries"]
                    break
                }
            }
        }
        table.reloadData()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

