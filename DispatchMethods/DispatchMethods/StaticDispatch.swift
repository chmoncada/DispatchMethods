//
//  StaticDispatch.swift
//  DispatchMethods
//
//  Created by Charles Moncada on 18-05-20.
//  Copyright © 2020 Charles Moncada. All rights reserved.
//

import Foundation

class PlainClass {
  var number: Int = 1

  func incrementNumber() {
    number += 1
  }
}

class SubclassedClass: PlainClass {
  var anotherNumber = 2

  override func incrementNumber() {
    anotherNumber += 1
  }
}

class PlainClassWithoutInheritance {
  var number = 1

  func incrementNumber() {
    number += 1
  }

}

final class FinalClass {
  var number: Int = 1

  func incrementNumber() {
    number += 1
  }
}

struct StaticStruct {
  var number = 1

  mutating func incrementNumber() {
    number += 1
  }
}

/// The Class we will use to test the performance and has all the test cases
class StaticDispatch {

  func testPlain(anObject: PlainClass) {
    for _ in 1...1000000 {
      anObject.incrementNumber()
    }
  }

  func testFinal(anObject: FinalClass) {
    for _ in 1...1000000 {
      anObject.incrementNumber()
    }
  }

  func testSubclassed(anObject: SubclassedClass) {
    for _ in 1...1000000 {
      anObject.incrementNumber()
    }
  }

  func testPlainClassWithoutInheritance(anObject: PlainClassWithoutInheritance) {
    for _ in 1...1000000 {
      anObject.incrementNumber()
    }
  }

  func testStaticStruct( anObject: inout StaticStruct) {
    for _ in 1...1000000 {
      anObject.incrementNumber()
    }
  }
}
