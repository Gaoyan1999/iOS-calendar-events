//
//  EditingPage.swift
//  MyCalendar
//
//  Created by 高彦 on 2021/7/3.
//  Copyright © 2021 高彦. All rights reserved.
//

import SwiftUI

struct EditingPage: View {
    
    
    @EnvironmentObject var userData :ToDo
    @Environment(\.presentationMode) var presentation
    
    @State var title : String = ""
    @State var duedate :Date  = Date()
    
    
    var id: Int?  = nil
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Event")){

                    TextField("Content", text: self.$title)
                    DatePicker(selection: self.$duedate, label: { Text("Date") })
                }
                
                Section(header: Text("Operation")){
                    
                    Button(action: {
                        
                        if(self.id != nil){
                            self.userData.edit(id: self.id!, data: SingleTodo(title: self.title, dueDate: self.duedate))
                        }else {
                            self.userData.add(data: SingleTodo(title: self.title, dueDate: self.duedate))
                        }
                            self.presentation.wrappedValue.dismiss()
                        
                    }){
                        Text("confirm")
                    }
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                        }){
                            Text("cancel")
                    }
                
            }
            }.navigationBarTitle("Editing")
    }
}
}

struct EditingPage_Previews: PreviewProvider {
    static var previews: some View {
        EditingPage()
    }
}
