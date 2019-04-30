//
//  ViewController.swift
//  SpotlightSearchDemo
//
//  Created by Yiyin Shen on 30/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit
import CoreSpotlight
//import MobileCoreServices

class ViewController: UIViewController {

    @IBOutlet weak var centerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType,
            let info = activity.userInfo,
            let selectedIdentifier = info[CSSearchableItemActivityIdentifier] as? String {
            print("Selected Identifier: \(selectedIdentifier)")
            centerLabel.text = "Selected Identifier: \(selectedIdentifier)"
        }
    }
}

