//
//  UserData.swift
//  MyCalendar
//
//  Created by 高彦 on 2021/7/3.
//  Copyright © 2021 高彦. All rights reserved.
//
import  Foundation

var encoder = JSONEncoder()
var decoder = JSONDecoder()



class ToDo: ObservableObject{
    @Published var toDoList : [SingleTodo]
    var count = 0
    
    init() {
        self.toDoList = []
        
    }
    
    init(data :[SingleTodo]){
        self.toDoList = []
        for item in data {
            self.toDoList.append(SingleTodo(title: item.title, dueDate: item.dueDate, isChecked: item.isChecked, id: count))
            count += 1;
        }
    }
    
    
    
    
    func add(data: SingleTodo){
        self.toDoList.append(SingleTodo(title: data.title, dueDate: data.dueDate,id: self.count))
        self.count += 1
        self.sort()
        self.dataStore()
    }
    
    func edit(id: Int , data : SingleTodo){
        self.toDoList[id].title = data.title
        self.toDoList[id].dueDate = data.dueDate
        self.toDoList[id].isChecked = false        
        self.sort()
        self.dataStore()
    }
    
    func delete(id :Int){
        self.toDoList[id].deleted = true
        self.sort()
        self.dataStore()
    }
    
    
    
    func check(id: Int){
        self.toDoList[id].isChecked.toggle()
        self.dataStore()
    }
    
    
    
    func sort() {
        self.toDoList.sort(by: {(s1,s2) in return s1.dueDate.timeIntervalSince1970 < s2.dueDate.timeIntervalSince1970
        })
        
        for i in 0..<self.toDoList.count{
            self.toDoList[i].id = i
        }
        
    }
    
    func  dataStore(){
        let encodedData = try!encoder.encode(self.toDoList)
            
        UserDefaults.standard.set(encodedData,forKey: "todoList")
    }
    
            
}

struct SingleTodo : Identifiable,Codable{
    var  title:String = ""
    var  dueDate: Date = Date()
    var isChecked: Bool = false
    var deleted  = false
    var id: Int = 0
}
