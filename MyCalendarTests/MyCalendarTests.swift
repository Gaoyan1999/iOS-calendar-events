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
        let a = DateHelper.getCountOfDaysInMonth(year: 2020,month:7);
        XCTAssertEqual(a, 31)
    }
    
    
    func testGetfirstWeekDayInMonth(){
        let a = DateHelper.getfirstWeekDayInMonth(year: 2021,month: 5);
        XCTAssertEqual(a, 6);
    }
    
    func testGetDateStructure() {
        let arr = DateHelper.getDateStructure(year: 2021, month: 7);
        XCTAssertEqual(arr, [["",""]]);
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
