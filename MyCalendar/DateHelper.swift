//
//  DateHelper.swift
//  MyCalendar
//
//  Created by 高彦 on 2021/7/4.
//  Copyright © 2021 高彦. All rights reserved.
//

import Foundation

class DateHelper:ObservableObject {
    
    static func getDateStructure(year:Int,month:Int) -> [[String]]{
        
        var output: [[String]] = []
        let firstDayOfWeek = getfirstWeekDayInMonth(year: year, month: month);
        let  days = getCountOfDaysInMonth(year: year, month: month);
        var rowOne : [String] = []
        
        
        for _ in 0...firstDayOfWeek-1 {
            rowOne.append(String(""))
        }
        output.append(rowOne);
        
        for i in 1...days {
            if(output[output.count-1].count>=7){
                var newRow :[String] = []
                newRow.append(String(i))
                output.append(newRow)
            }else{
                output[output.count-1].append(String(i))
            }
        }
        while  output[output.count-1].count < 7 {
            output[output.count-1].append(String(""))
        }
        
        
        
        return output
    }
     
        //根据年月得到某月天数
        static func getCountOfDaysInMonth(year:Int,month:Int) ->Int{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM"
            let date
                = dateFormatter.date(from: String(year)+"-"+String(month))
            let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
            let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: date!)
            return (range?.length)!
        }
        // 根据年月得到某月第一天是周几
        static func getfirstWeekDayInMonth(year:Int,month:Int) -> Int{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM"
            let date
                = dateFormatter.date(from: String(year)+"-"+String(month))
            let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
            let comps = (calendar as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: date!)
            let week = comps?.weekday
            return week! - 1
        }

}
