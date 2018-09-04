//
//  HomeViewController.swift
//  SampleApp
//
//  Created by Steve Wilford on 19/08/2018.
//  Copyright © 2018 Off Topic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBAction func logout() {
        dismiss(animated: true, completion: nil)
    }
}
