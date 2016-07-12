//
//  Person.swift
//  SecsionIndex
//
//  Created by Quan on 7/12/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import Foundation

class Person {
    static var arrayFirstNameMen : [String]!
    static var arrayFirstNameWomen : [String]!
    static var arrayLastName : [String]!
    static var arrayMiddleNameMen : [String]!
    static var arrayMiddleNameWomen : [String]!
    static var arrayHeadOfPhoneNumber : [Int]!
    
    var firstName : String!
    var lastName : String!
    var middleName : String!
    var fullName : String!
    var headOfPhoneNumer : Int!
    var lastOfPhoneNumber : Int!
    var fullPhoneNumber : String!
    
    
    static var isCheck : Bool = true
    
    init() {
        if Person.isCheck == true {
            Person.arrayFirstNameMen = ["Anh", "Bắc", "Biên", "Chung", "Chiến", "Chính", "Công", "Dươnng", "Dũng", "Đạo", "Điền", "Đạt", "Kiên", "Kiểm", "Long", "Mạnh", "Nam", "Nhân", "Phúc", "Phước", "Phú", "Quảng", "Quân"]
            Person.arrayFirstNameWomen = ["An", "Anh", "Ánh", "Chung", "Dung", "Giang", "Hằng", "Hương", "Khánh", "Liên", "Linh", "Liễu", "Mai", "Nhi", "Nhung", "Oanh", "Phúc", "Quyên", "Quỳnh", "Thuỷ", "Thảo", "Tú", "Phương", "Hoa", "Huệ", "Uyên"]
            Person.arrayMiddleNameMen = ["Văn", "Đăng", "Bảo", "Đình", "Minh", "Vĩnh", "Hữu", "Công", "Khắc", "Duy", "Kim", "Thế", "Xuân"]
            Person.arrayMiddleNameWomen = ["Thị", "Ngọc", "Thuỳ"]
            Person.arrayLastName = ["Nguyễn", "Hoàng", "Trần", "Phạm", "Đặng", "Trịnh", "Đỗ", "Đinh", "Lê", "Vũ", "Bùi", "Hồ", "Ngô", "Dương", "Lý"]
            
            Person.arrayHeadOfPhoneNumber = [96, 97, 98, 162, 163, 0164, 0165, 0166, 0167, 0168, 0169, 091, 094, 123, 125, 127, 129]
            Person.isCheck = false
        }
        
        let genderIndex = arc4random_uniform(2)
        
        if genderIndex == 0 {
            middleName = Person.arrayMiddleNameWomen[Int(arc4random_uniform(UInt32(Person.arrayMiddleNameWomen.count)))]
            firstName = Person.arrayFirstNameWomen[Int(arc4random_uniform(UInt32(Person.arrayFirstNameWomen.count)))]
        } else {
            middleName = Person.arrayMiddleNameMen[Int(arc4random_uniform(UInt32(Person.arrayMiddleNameMen.count)))]
            firstName = Person.arrayFirstNameMen[Int(arc4random_uniform(UInt32(Person.arrayFirstNameMen.count)))]
        }
        
        lastName = Person.arrayLastName[Int(arc4random_uniform(UInt32(Person.arrayLastName.count)))]
        
        fullName = lastName + " " + middleName + " " + firstName
        
        headOfPhoneNumer = Int(Person.arrayHeadOfPhoneNumber[Int(arc4random_uniform(UInt32(Person.arrayHeadOfPhoneNumber.count)))])
        
        lastOfPhoneNumber = Int(arc4random_uniform(10000000))
        
        fullPhoneNumber = "0\(headOfPhoneNumer * 10000000 + lastOfPhoneNumber)"
        
    }
    
    


}