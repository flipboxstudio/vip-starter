//
//  Global.swift
//  Base Project
//
//  Created by Saminos on 07/06/17.
//  Copyright © 2017 Flipbox. All rights reserved.
//

import UIKit

class Storyboard {
  private class func storyboard() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }
  
  class func viewController(by storyboardId:String) -> UIViewController{
    return storyboard().instantiateViewController(withIdentifier: storyboardId)
  }
}
