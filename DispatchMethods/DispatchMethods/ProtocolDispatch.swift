//
//  ProtocolDispatch.swift
//  DispatchMethods
//
//  Created by Charles Moncada on 18-05-20.
//  Copyright © 2020 Charles Moncada. All rights reserved.
//

import Foundation

protocol People {
  @discardableResult func score() -> Int
}

struct Student: People {
  @discardableResult func score() -> Int {
    var number = 0
    number += 1
    return number
  }
}

class ProtocolDispatch {

  func scorePeople() {
    let students: [People] = [Student(), Student(), Student()]
    for student in students {
      student.score()
    }
  }

  func scoreStudent() {
    let students: [Student] = [Student(), Student(), Student()]
    for student in students {
      student.score()
    }
  }

  func testPeople() {
    for _ in 1...1000000 {
      scorePeople()
    }
  }

  func testStudent() {
    for _ in 1...1000000 {
      scoreStudent()
    }
  }
}
