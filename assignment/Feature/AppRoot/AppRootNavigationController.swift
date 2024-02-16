//
//  AppRootNavigationController.swift
//  assignment
//
//  Created by Miaki Limited on 2/16/24.
//

import UIKit

class AppRootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    static func getSearchViewController()->SearchViewController{
        
        return SearchViewController()
        
    }
    

}
