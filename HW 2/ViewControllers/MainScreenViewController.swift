//
//  MainScreenViewController.swift
//  ColorsDelegate
//
//  Created by Nechaev Sergey  on 05.09.2021.
//  All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        //settingsVC.redLabel.text = "0"
        settingsVC.redSliderEditValue = 1
        settingsVC.greenSliderEditValue = 1
        settingsVC.blueSliderEditValue = 1
        
    }
    
    

}
