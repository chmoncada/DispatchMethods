//
//  DispatchMethodsTests.swift
//  DispatchMethodsTests
//
//  Created by Charles Moncada on 18-05-20.
//  Copyright © 2020 Charles Moncada. All rights reserved.
//

import XCTest
@testable import DispatchMethods

class PerformanceTesterTests: XCTestCase {

  var staticDispatch: StaticDispatch!
  var protocolDispatch: ProtocolDispatch!

  var plainObject: PlainClass!
  var finalObject: FinalClass!
  var plainWIthoutInheritanceObject: PlainClassWithoutInheritance!
  var staticStructObject: StaticStruct!
  var subclassedObject: SubclassedClass!

  override func setUp() {
    super.setUp()

    staticDispatch = StaticDispatch()
    protocolDispatch = ProtocolDispatch()

    plainObject = PlainClass()
    finalObject = FinalClass()
    plainWIthoutInheritanceObject = PlainClassWithoutInheritance()
    staticStructObject = StaticStruct()
    subclassedObject = SubclassedClass()

  }

  func testPerformanceExample() {

    self.measure {
      self.staticDispatch.testFinal(anObject: finalObject)     // FINAL CLASS
      self.staticDispatch.testPlainClassWithoutInheritance(anObject: plainWIthoutInheritanceObject)     // Class without any final keyword but which is NOT subclassed as well
      self.staticDispatch.testPlain(anObject: plainObject)     // Class without any final keyword but which is subclassed
      self.staticDispatch.testSubclassed(anObject: subclassedObject) // Class which has a parent class Foo
      self.staticDispatch.testStaticStruct(anObject: &staticStructObject)

    }
  }

  func testProtocolPerformanceExample() {

    self.measure {
      self.protocolDispatch.testPeople()
      self.protocolDispatch.testStudent()
    }
  }

}
