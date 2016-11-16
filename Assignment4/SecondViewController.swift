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
    
     func numberOfSectionsInTableView(table: UITableView) -> Int {
        return 1 //one section
    }
     func tableView(table: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return "contacts"
        return "Users:Scores"
    }
     func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return contacts.count()
        return 1
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
       return cell
    }

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

