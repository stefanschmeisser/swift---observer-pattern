//
//  Model.swift
//  observerTest
//
//  Created by Stefan Schmeisser on 12.01.15.
//  Copyright (c) 2015 Stefan Schmeisser. All rights reserved.
//

import UIKit

protocol IModel {
  func attachObserver(observer: ModelObserver)
  func detchObserver(observer: ModelObserver)
  func notifyObserver()
}

class Model: NSObject, IModel {
  
  var colorRed: Int
  var colorGreen: Int
  var colorBlue: Int
  var observerList: [ModelObserver] = []
  
  override init() {
    colorRed = 0
    colorGreen = 0
    colorBlue = 0
  }
  
  func setColorRed(currentColor: Int) {
    self.colorRed = currentColor
    self.notifyObserver()
  }
  
  func getColorRed() -> Int {
    return self.colorRed
  }
  
  func setColorGreen(currentColor: Int) {
    self.colorGreen = currentColor
    self.notifyObserver()
  }
  
  func getColorGreen() -> Int {
    return self.colorGreen
  }
  
  func setColorBlue(currentColor: Int) {
    self.colorBlue = currentColor
    self.notifyObserver()
  }
  
  func getColorBlue() -> Int {
    return self.colorBlue
  }
  
  
  func attachObserver(observer: ModelObserver) {
    self.observerList.append(observer)
  }
  
  func detchObserver(observer: ModelObserver) {
    println("detach Observer")
  }
  
  func notifyObserver() {
    for observer: ModelObserver in self.observerList {
      observer.updateObserver(self.getColorRed(), green: self.getColorGreen(), blue: self.getColorBlue())
    }
  }
  
}
