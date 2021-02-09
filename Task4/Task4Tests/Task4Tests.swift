//
//  Task4Tests.swift
//  Task4Tests
//
//  Created by Denis Larin on 08.02.2021.
//

import XCTest
@testable import Task4

class Task4Tests: XCTestCase {
    
    var sut: ViewController!

    override func setUpWithError() throws {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
    }
    
    
    func testHasTitleTextField() {
        XCTAssertTrue(sut.enterLogin.isDescendant(of: sut.view))
    }
    
    func testResultCheck() {
        XCTAssertNotNil(sut.resultCheck)
        XCTAssertTrue(sut.resultCheck.isDescendant(of: sut.view))
    }
    
    func testCheckLoginButtonHasCheckLoginMetod() {
        let checkLoginButton = sut.checkLoginButton
        
        guard let actions = checkLoginButton?.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(actions.contains("checkLogin"))
    }
    
    func testCheckLoginMetod() {
        sut.enterLogin.text = "-Foo"
        guard let login = sut.enterLogin.text else { return }
        
        if login.loginСonditions() {
            sut.resultCheck.text = "Success"
        } else {
            sut.resultCheck.text = "Error"
        }
        XCTAssertEqual(sut.resultCheck.text, "Error")
                
    }
    
    
        
    func testLoginCanBeEmailOrString() {
        let emailLogin = "Foo@Bar.Baz"
        let stringLogin = "Foo"
        
        XCTAssertTrue(emailLogin.loginСonditions())
        XCTAssertTrue(stringLogin.loginСonditions())
    }
    
    func testLoginIsShort() {
        let shortLogin = "Fo"
        
        XCTAssertFalse(shortLogin.loginСonditions())
    }
    func testLoginIsLong() {
        let longLogin = "FooBarBazFooBarBazFooBarBaz29Fo33"
        
        XCTAssertFalse(longLogin.loginСonditions())
    }
    
    func testLoginCanConsistOfLatinLettersNumbersMinusPeriod() {
        let latinLetters = "Foo"
        let russianLetters = "фуу"
        let withNumber = "Foo3"
        let withMinus = "Foo-"
        let withPeriod = "Foo."
        
        XCTAssertTrue(latinLetters.loginСonditions())
        XCTAssertFalse(russianLetters.loginСonditions())
        XCTAssertTrue(withNumber.loginСonditions())
        XCTAssertTrue(withMinus.loginСonditions())
        XCTAssertTrue(withPeriod.loginСonditions())
    }
    
    func testLoginCanNotStartWithNumberPeriodMinus() {
        let firstNumber = "3Foo"
        let firstPeriod = ".Foo"
        let firstMinus = "-Foo"
        
        XCTAssertFalse(firstNumber.loginСonditions())
        XCTAssertFalse(firstPeriod.loginСonditions())
        XCTAssertFalse(firstMinus.loginСonditions())
    }
}


