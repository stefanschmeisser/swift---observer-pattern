//
//  ViewController.swift
//  observerTest
//
//  Created by Stefan Schmeisser on 12.01.15.
//  Copyright (c) 2015 Stefan Schmeisser. All rights reserved.
//

import UIKit

protocol ModelObserver {
  func updateObserver(red: Int, green: Int, blue: Int)
}

class ViewController: UIViewController, ModelObserver {

  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var colorSliderRed: UISlider!
  @IBOutlet weak var colorSliderGreen: UISlider!
  @IBOutlet weak var colorSliderBlue: UISlider!
  @IBOutlet weak var colorTextFieldRed: UITextField!
  @IBOutlet weak var colorTextFieldGreen: UITextField!
  @IBOutlet weak var colorTextFieldBlue: UITextField!
  
  var model: Model = Model()

  @IBAction func onColorSilderRedValueChanged(sender: AnyObject) {
    model.setColorRed(Int(self.colorSliderRed.value))
  }
  
  @IBAction func onColorSilderGreenValueChanged(sender: AnyObject) {
    model.setColorGreen(Int(self.colorSliderGreen.value))
  }
  
  @IBAction func onColorSilderBlueValueChanged(sender: AnyObject) {
    model.setColorBlue(Int(self.colorSliderBlue.value))
  }

  @IBAction func onColorTextFieldRedValueChanged(sender: UITextField) {
    model.setColorRed(self.colorTextFieldRed.text.toInt()!)
  }
  
  @IBAction func onColorTextFieldGreenValueChanged(sender: UITextField) {
    model.setColorGreen(self.colorTextFieldGreen.text.toInt()!)
  }
  
  @IBAction func onColorTextFieldBlueValueChanged(sender: UITextField) {
    model.setColorBlue(self.colorTextFieldBlue.text.toInt()!)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.model.attachObserver(self)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func updateObserver(red: Int, green: Int, blue: Int) {
    self.colorSliderRed.value = Float(red)
    self.colorSliderGreen.value = Float(green)
    self.colorSliderBlue.value = Float(blue)
    self.colorTextFieldRed.text = String(red)
    self.colorTextFieldGreen.text = String(green)
    self.colorTextFieldBlue.text = String(blue)
    self.colorView.backgroundColor = UIColor(red: (CGFloat(red) / 255), green: (CGFloat(green) / 255), blue: (CGFloat(blue) / 255), alpha: 1.0)
  }

}

