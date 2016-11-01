//
//  AppDependenciesTests.swift
//  AppDependenciesTests
//
//  Created by Gujgiczer Máté on 2016. 11. 01..
//  Copyright © 2016. gujci. All rights reserved.
//

import XCTest
@testable import AppDependencies

final class TestInjectable: Injectable {
    
    func foo() { print("foo") }
        
    static func create() -> TestInjectable {
        return TestInjectable()
    }
}

class AppDependenciesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBasics() {
        let injected: TestInjectable = Dependencies.shared.request()
        injected.foo()
    }
}
