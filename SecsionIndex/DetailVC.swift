//
//  DetailVC.swift
//  SecsionIndex
//
//  Created by Quan on 7/12/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var person = Person()
    var labelName = UILabel()
    
    var phoneView = UIView()
    let labelPhone = UILabel()
    let labelMobile = UILabel()
    let buttonCall = UIButton()
    let buttonMessenger = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.labelName.frame = CGRectMake(30, 100, 300, 50)
        self.labelName.font = UIFont.boldSystemFontOfSize(25)
        self.labelName.text = person.lastName + " " + person.firstName
        
        phoneView.frame = CGRectMake(30, 200, 350, 50)
        self.phoneView.backgroundColor = UIColor.whiteColor()
        
        labelMobile.text = "Mobile"
        labelMobile.font = UIFont.boldSystemFontOfSize(20)
        labelMobile.frame = CGRectMake(0, 0, 125, 25)
        
        labelPhone.text = person.fullPhoneNumber
        labelPhone.frame = CGRectMake(0, 25, 125, 25)
        
        buttonCall.setImage(UIImage(named: "iconPhone.png"), forState: .Normal)
        buttonCall.frame = CGRectMake(300, 0, 50, 50)
        
        
        buttonMessenger.setImage(UIImage(named: "iconTalk.png"), forState: .Normal)
        buttonMessenger.frame = CGRectMake(230, 0, 50, 50)
        
        self.view.addSubview(phoneView)
        phoneView.addSubview(labelMobile)
        phoneView.addSubview(labelPhone)
        phoneView.addSubview(buttonCall)
        phoneView.addSubview(buttonMessenger)
        
        self.view.addSubview(labelName)

    }

    

}
