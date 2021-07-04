//
//  CalendarReview.swift
//  MyCalendar
//
//  Created by 高彦 on 2021/7/3.
//  Copyright © 2021 高彦. All rights reserved.
//

import SwiftUI

struct CalendarReview: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true){
            
            VStack {
                
                ForEach(1..<13){
                    i in oneMonth(year: 2021, month: i)
                }
                
                
                
                
            }
            
        }

        
    }
    
}

struct oneMonth: View{
    
    var year : Int
    var month: Int
    var dateCell : [[String]]
    
    init(year: Int,month : Int) {
        self.year = year
        self.month = month
        self.dateCell = DateHelper.getDateStructure(year: year, month: month)
    }
    
    var body: some View {        
        VStack {
            HStack {
                Group {
                    Text(String(self.year)).padding(.leading)
                    Text("-")
                    Text(String(self.month))
                }.font(.title).foregroundColor(.gray)
                
                Spacer()
            }
            HStack(spacing: 6.0){
                Group {
                    Text("S")
                    Text("M")
                    Text("T")
                    Text("W")
                    Text("T")
                    Text("F")
                    Text("S")
                    
                }.font(.largeTitle).frame(width: 50,height : 50)
                
            }
            VStack{
                ForEach(0..<self.dateCell.count){
                    row in
                    HStack{
                        ForEach(0..<self.dateCell[row].count){
                            col in
                            Text(self.dateCell[row][col])
                            .frame(width: 50,height: 50)
                                .background(Color.blue)
                            .cornerRadius(10)
                         .shadow(radius: 10,x:0,y:10)                            
                    }
                    }
                }.padding()
                
                
            }
            Spacer()
        }        
    }
}




struct CalendarReview_Previews: PreviewProvider {
    static var previews: some View {
        CalendarReview()
    }
}
