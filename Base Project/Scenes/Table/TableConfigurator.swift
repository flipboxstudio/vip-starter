//
//  TableConfigurator.swift
//  Base Project
//
//  Created by Saminos on 07/06/17.
//  Copyright (c) 2017 Flipbox. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

class TableConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = TableConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: TableViewController)
  {
    let router = TableRouter()
    router.viewController = viewController
    
    let presenter = TablePresenter()
    presenter.output = viewController
    
    let interactor = TableInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}