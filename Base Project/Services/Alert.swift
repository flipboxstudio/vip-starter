//
//  Alert.swift
//  Base Project
//
//  Created by Saminos on 08/06/17.
//  Copyright © 2017 Flipbox. All rights reserved.
//

import UIKit

class Alert:UIAlertController {
  
  @discardableResult
  static func showInfo(viewController: UIViewController, title: String?, message: String?, preferredStyle: UIAlertControllerStyle = .alert, buttonTouched:((UIAlertAction)->Void)? = nil) -> UIAlertController {
    
    let alert = Alert(title: title, message: message, preferredStyle: preferredStyle)
    viewController.present(alert, animated: true, completion: nil)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: buttonTouched)
    alert.addAction(okAction)
    
    return alert
  }
  
  @discardableResult
  static func showError(viewController: UIViewController, title: String? = "Sorry", message: String?, preferredStyle: UIAlertControllerStyle = .alert, buttonTouched:((UIAlertAction)->Void)? = nil) -> UIAlertController {
    return showInfo(viewController: viewController, title: title, message: message, preferredStyle: preferredStyle, buttonTouched: buttonTouched)
  }
  
  @discardableResult
  static func showSucceess(viewController: UIViewController, title: String?, message: String?, preferredStyle: UIAlertControllerStyle = .alert, buttonTouched:((UIAlertAction)->Void)? = nil) -> UIAlertController {
    return showInfo(viewController: viewController, title: title, message: message, preferredStyle: preferredStyle, buttonTouched: buttonTouched)
  }
  
  
  
  
  
}
