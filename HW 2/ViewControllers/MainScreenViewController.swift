//
//  MainScreenViewController.swift
//  ColorsDelegate
//
//  Created by Nechaev Sergey  on 05.09.2021.
//  All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(redSettings: CGFloat, greenSettings: CGFloat, blueSettings: CGFloat)
}

class MainScreenViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    
    private var redSettings: CGFloat = 1
    private var greenSettings: CGFloat = 1
    private var blueSettings: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = UIColor(
            red: redSettings,
            green: greenSettings,
            blue: blueSettings,
            alpha: 1
        )

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.redSliderEditValue = Float(redSettings)
        settingsVC.greenSliderEditValue = Float(greenSettings)
        settingsVC.blueSliderEditValue = Float(blueSettings)
        settingsVC.delegate = self
        
    }
    
}

extension MainScreenViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(redSettings: CGFloat, greenSettings: CGFloat, blueSettings: CGFloat) {
        self.redSettings = redSettings
        self.greenSettings = greenSettings
        self.blueSettings = blueSettings
        
        backgroundView.backgroundColor = UIColor(
            red: redSettings,
            green: greenSettings,
            blue: blueSettings,
            alpha: 1
        )
    }
}
