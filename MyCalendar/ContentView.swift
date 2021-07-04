//
//  ContentView.swift
//  MyCalendar
//
//  Created by 高彦 on 2021/7/3.
//  Copyright © 2021 高彦. All rights reserved.
//

import SwiftUI

func initUserData() -> [SingleTodo]{
    var output: [SingleTodo] = []
    if let dataStored = UserDefaults.standard.object(forKey: "todoList") as? Data {
        let data = try!decoder.decode([SingleTodo].self, from: dataStored)
        for item in data {
            if !item.deleted {
                output.append(SingleTodo(title: item.title, dueDate: item.dueDate, isChecked: item.isChecked,id : output.count))
            }
        }
    }
    return output;
}

struct ContentView: View {
    
    @ObservedObject var userData: ToDo = ToDo(data: initUserData());
    
    @State var showEdit  = false;
    
    var body: some View {
        
        TabView {
            NavigationView {
                // view 1
                       ZStack {
                           NavigationView{
               
                                       ScrollView(.vertical, showsIndicators: true){
                                           VStack {
                                               ForEach(self.userData.toDoList){
                                                   item in
                                                   if(!item.deleted){
                                                   SingleCardView(index: item.id)
                                                       .environmentObject(self.userData)
                                                       .padding(.top)
                                                       .padding(.horizontal)
                                                   }
                                               }
                                           }
                                       }.navigationBarTitle("Todo List")
                           }
               
               
                           VStack {
                               Spacer()
                               HStack {
                                   Spacer()
               
                                   Button(action: {
                                       //action
                                       self.showEdit = true;
               
                                   }){
                                   Image(systemName: "plus.circle.fill")
                                       .resizable().aspectRatio(contentMode: ContentMode.fit)
                                       .frame(width: 80.0)
                                       .foregroundColor(.blue)
                                       .padding()
                                   }.sheet(isPresented: self.$showEdit,content: {
                                       EditingPage().environmentObject(self.userData)
               
                                   }) //sheet
                               }
                           }
                       }
                       
            }
            .tabItem {
                Image(systemName: "rectangle.grid.1x2.fill")
                Text("Events")
            }.tag(0)
            
            
        
            NavigationView {
                
                // view 2
                CalendarReview()
            }.tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }.tag(1)
        }
        .edgesIgnoringSafeArea(.top)
                
    }
    
}


struct SingleCardView : View{
  
    var index :Int;
    @EnvironmentObject var userData: ToDo;
    @State var showEditingPage = false
    
    var body: some View {
        return HStack {
            // col 1
            Rectangle().frame(width: 6).foregroundColor(.blue)
            
            //垃圾桶
            Button(action: {
                self.userData.delete(id: self.index)
            }){
                Image(systemName: "trash").imageScale(.large).padding(.leading)
                    .foregroundColor(.black)
            }
            
            
            
            Button(action: {
                self.showEditingPage = true
            }){
                Group {
                    VStack(alignment: .leading,spacing: 6.0) {
                        Text(self.userData.toDoList[index].title)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                        Text(self.userData.toDoList[index].dueDate.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }.padding(.leading)
                    //col 3
                    Spacer()
                }
            }.sheet(isPresented: self.$showEditingPage, content:{
                EditingPage(title: self.userData.toDoList[self.index].title,
                            duedate: self.userData.toDoList[self.index].dueDate,
                            id: self.index)
                    .environmentObject(self.userData)
            })
            
            
            
            //check box
            Image(systemName: self.userData.toDoList[index].isChecked ? "checkmark.square.fill":"square")
                .imageScale(.large).padding(.all)
                .onTapGesture {
                    self.userData.check(id: self.index)
            }
        }.frame(height: 80)
        .background(Color.white)
        .cornerRadius(10)
            .shadow(radius: 10,x:0,y:10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
