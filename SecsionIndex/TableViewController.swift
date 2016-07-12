//
//  TableViewController.swift
//  SecsionIndex
//
//  Created by Quan on 7/12/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayData : NSMutableArray!
    var dictContact = NSMutableDictionary()
    var arrayKey : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        self.tableView.sectionIndexBackgroundColor = UIColor.grayColor()
        
        //tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        arrayData = NSMutableArray()
        
        for  i in 0..<60 {
            arrayData.addObject(Person())
            let person = arrayData[i] as! Person
            print(person.fullName)
        }
        
        for element in arrayData {
            let person = element as! Person
            var firstLetter: String = (person.firstName as! NSString!).substringToIndex(1)
            
            var arrayForLetter: NSMutableArray!
            
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            
            if (dictContact.valueForKey(firstLetter) != nil) {
                arrayForLetter = dictContact.valueForKey(firstLetter) as! NSMutableArray
                arrayForLetter.addObject(person)
                dictContact.setValue(arrayForLetter, forKey: firstLetter)
            } else {
                arrayForLetter = NSMutableArray(object: person)
                dictContact.setValue(arrayForLetter, forKey: firstLetter)
            }
            
        }
        
        arrayKey = dictContact.allKeys as! [String]
        arrayKey = arrayKey.sortedArrayUsingSelector("compare:")
        
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrayKey.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionTitle = arrayKey[section]
        let sectionPerson = dictContact[sectionTitle as! String]
        
        return (sectionPerson?.count)!
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayKey as! [String]
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPerson = dictContact[sectionTitle as! String]

        let person = sectionPerson![indexPath.row] as! Person
        cell?.textLabel?.text = person.fullName
        cell?.detailTextLabel?.text = person.fullPhoneNumber

        return cell!
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section] as? String
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailVC()
        let selectionTitle = arrayKey[indexPath.section]
        let selectionPerson = dictContact[selectionTitle as! String]
        
        let person = selectionPerson![indexPath.row] as! Person
        
        detailVC.person = person
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    

}
