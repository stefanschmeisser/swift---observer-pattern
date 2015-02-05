//
//  Model.swift
//  observerTest
//
//  Created by Stefan Schmeisser on 12.01.15.
//  Copyright (c) 2015 Stefan Schmeisser. All rights reserved.
//

import UIKit

protocol IModel {
  func notifyObserver()
}

class Model: NSObject, IModel {
  
  var notificationCenter: NSNotificationCenter = NSNotificationCenter.defaultCenter()
  
  var colorRed: Int = 0 {
    didSet {
      notifyObserver()
    }
  }
  
  var colorGreen: Int = 0 {
    didSet {
      notifyObserver()
    }
  }
  
  var colorBlue: Int = 0 {
    didSet {
      notifyObserver()
    }
  }
  
  func setColorRed(currentColor: Int) {
    self.colorRed = currentColor
  }
  
  func getColorRed() -> Int {
    return self.colorRed
  }
  
  func setColorGreen(currentColor: Int) {
    self.colorGreen = currentColor
  }
  
  func getColorGreen() -> Int {
    return self.colorGreen
  }
  
  func setColorBlue(currentColor: Int) {
    self.colorBlue = currentColor
  }
  
  func getColorBlue() -> Int {
    return self.colorBlue
  }
  
  func notifyObserver() {
    self.notificationCenter.postNotificationName("colorDidChange", object: nil, userInfo: ["red": self.colorRed, "green": self.colorGreen, "blue": self.colorBlue])
  }
  
}
