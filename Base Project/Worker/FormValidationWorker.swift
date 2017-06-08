//
//  FormValidationWorker.swift
//  Base Project
//
//  Created by Saminos on 07/06/17.
//  Copyright © 2017 Flipbox. All rights reserved.
//

import Foundation

class FormValidationWorker {
  
  internal func isValidPassword(password:String?) -> Bool {
    guard let password = password else { return false }
    return password != ""
  }
  
  internal func isValidEmail(email:String?) -> Bool {
    guard let email = email else { return false }
    return validation(with: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", value: email)
  }
  
  private func validation(with regex:String, value:String) -> Bool {
    let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
    return predicate.evaluate(with: value)
  }
}
