//
//  LoginWorker.swift
//  Base Project
//
//  Created by Saminos on 07/06/17.
//  Copyright (c) 2017 Flipbox. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import Alamofire

class LoginWorker
{
  // MARK: - Business Logic
  
  func doSomeWork()
  {
    // NOTE: Do the work
  }
  
  func login(request:Login.FetchUser.Request, onComplete:@escaping (_ response:Login.FetchUser.Response)->()) {
    
    let validation = loginValidation(request: request)
    
    if !validation.isValid {
      let response = Login.FetchUser.Response(
        user: nil,
        isSuccess: false,
        errorMessage: validation.errorMessage
      )
      
      onComplete(response)
      return
    }
    
    Alamofire.request("http://jsonplaceholder.typicode.com/users/1").responseJSON { response in
      guard let value = response.result.value as? [String:Any] else {
        let response = Login.FetchUser.Response(
          user: nil, isSuccess: false,errorMessage: response.result.error?.localizedDescription
        )
        onComplete(response)
        return
      }
      
      let user = User(
        id: value["id"] as? Int ?? 0,
        name: value["name"] as? String ?? "",
        username: value["username"] as? String ?? "",
        email: value["email"] as? String ?? ""
      )
      
      let response = Login.FetchUser.Response(
        user: user, isSuccess: true, errorMessage: nil
      )
      onComplete(response)
    }
  }
  
  private func loginValidation(request:Login.FetchUser.Request) -> (isValid:Bool, errorMessage:String?) {
    
    let formValidation = FormValidationWorker()

    if !formValidation.isValidEmail(email: request.email)  {
      return (false, "Your email not valid")
    }
    
    if !formValidation.isValidPassword(password: request.password) {
      return (false, "Yout password not valid")
    }
    return (true, nil)
  }
  
  
}









