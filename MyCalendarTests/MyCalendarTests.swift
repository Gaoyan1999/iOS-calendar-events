//
//  MyCalendarTests.swift
//  MyCalendarTests
//
//  Created by 高彦 on 2021/7/3.
//  Copyright © 2021 高彦. All rights reserved.
//

import XCTest
@testable import MyCalendar


class MyCalendarTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    func testGetCountOfDaysInMonth(){
        
        XCTAssertEqual(DateHelper.getCountOfDaysInMonth(year: 2020,month:7), 31);
                
        XCTAssertEqual(DateHelper.getCountOfDaysInMonth(year: 2020,month:8), 31);
        
        XCTAssertEqual(DateHelper.getCountOfDaysInMonth(year: 2020,month:2), 29);
        
        XCTAssertEqual(DateHelper.getCountOfDaysInMonth(year: 2021,month:2), 28);
        
        XCTAssertEqual(DateHelper.getCountOfDaysInMonth(year: 2021,month:3), 31);
        
        XCTAssertEqual(DateHelper.getCountOfDaysInMonth(year: 2021,month:4), 30);
        
        XCTAssertEqual(DateHelper.getCountOfDaysInMonth(year: 2021,month:1), 31);
        
    }
    
    
    func testGetfirstWeekDayInMonth(){
         
        XCTAssertEqual(DateHelper.getfirstWeekDayInMonth(year: 2021,month: 5), 6);
            
        XCTAssertEqual(DateHelper.getfirstWeekDayInMonth(year: 2021,month: 6), 2);

        XCTAssertEqual(DateHelper.getfirstWeekDayInMonth(year: 2021,month: 7), 4);
        
        XCTAssertEqual(DateHelper.getfirstWeekDayInMonth(year: 2021,month: 8), 0);
        
    }
    
    func testGetDateStructure() {
        let arr1 = DateHelper.getDateStructure(year: 2021, month: 7);
        XCTAssertEqual(arr1, [["", "", "", "", "1", "2", "3"],
                             ["4", "5", "6", "7", "8", "9", "10"],
                             ["11", "12", "13", "14", "15", "16", "17"],
                             ["18", "19", "20", "21", "22", "23", "24"],
                             ["25", "26", "27", "28", "29", "30", "31"]]);
        
        
        let arr2 = DateHelper.getDateStructure(year: 2021, month: 2);
        XCTAssertEqual(arr2,[["", "1", "2", "3", "4", "5", "6"],
                             ["7", "8", "9", "10", "11", "12", "13"],
                             ["14", "15", "16", "17", "18", "19", "20"],
                             ["21", "22", "23", "24", "25", "26", "27"],
                             ["28", "", "", "", "", "", ""]]);
        
        let arr3 = DateHelper.getDateStructure(year: 2020, month: 2);
           XCTAssertEqual(arr3,[["", "", "", "", "", "", "1"],
                                ["2", "3", "4", "5", "6", "7", "8"],
                                ["9", "10", "11", "12", "13", "14", "15"],
                                ["16", "17", "18", "19", "20", "21", "22"],
                                ["23", "24", "25", "26", "27", "28", "29"]]);
        
    }
    
    
    func testAdd(){
        let todo = ToDo()
    
        todo.add(data: SingleTodo(title: "test1", dueDate: Date(), isChecked: false))
        todo.add(data: SingleTodo(title: "test2", dueDate: Date(), isChecked: false))
        XCTAssertEqual(todo.self.toDoList[0].title,"test1")
        XCTAssertEqual(todo.self.toDoList[0].isChecked,false)
        
        XCTAssertEqual(todo.self.toDoList[1].title,"test2")
        XCTAssertEqual(todo.self.toDoList[1].isChecked,false)
        
    }
    
    func  testEdit(){
        
        let todo = ToDo()
        todo.add(data: SingleTodo(title: "test1", dueDate: Date(), isChecked: false))
        
        todo.edit(id: 0,data: SingleTodo(title: "changed", dueDate: Date(), isChecked: false))
        
        XCTAssertEqual(todo.self.toDoList[0].title,"changed")
        
    }
    
    func testDelete(){
        let todo = ToDo()
        todo.add(data: SingleTodo(title: "test1", dueDate: Date(), isChecked: false))
        todo.delete(id: 0);
        XCTAssertEqual(todo.self.toDoList[0].deleted,true)
    }
    
    func testCheck() {
        let todo  = ToDo()
        todo.add(data: SingleTodo(title: "test1", dueDate: Date(), isChecked: false))
        
        todo.check(id: 0);
        
        XCTAssertEqual(todo.self.toDoList[0].isChecked,true)
        
    }
    
    
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            let todo = ToDo()
            for _ in 0..<100
            {
             todo.add(data: SingleTodo(title: "test1", dueDate: Date(), isChecked: false))
            }
                
        }
    }
    
    

}
