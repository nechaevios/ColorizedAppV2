//
//  MainScreenViewController.swift
//  ColorsDelegate
//
//  Created by Nechaev Sergey  on 05.09.2021.
//  All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(
        redColorDelegateValue: CGFloat,
        greenColorDelegateValue: CGFloat,
        blueColorDelegateValue: CGFloat
    )
}

class MainScreenViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    
    private var mainRedColorValue: CGFloat = 1
    private var mainGreenColorValue: CGFloat = 1
    private var mainBlueColorValue: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = UIColor(
            red: mainRedColorValue,
            green: mainGreenColorValue,
            blue: mainBlueColorValue,
            alpha: 1
        )

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.redSliderValueContainer = Float(mainRedColorValue)
        settingsVC.greenSliderValueContainer = Float(mainGreenColorValue)
        settingsVC.blueSliderValueContainer = Float(mainBlueColorValue)
        settingsVC.delegate = self
        
    }
    
}

extension MainScreenViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(
        redColorDelegateValue: CGFloat,
        greenColorDelegateValue: CGFloat,
        blueColorDelegateValue: CGFloat
    ) {
        mainRedColorValue = redColorDelegateValue
        mainGreenColorValue = greenColorDelegateValue
        mainBlueColorValue = blueColorDelegateValue
        
        backgroundView.backgroundColor = UIColor(
            red: redColorDelegateValue,
            green: greenColorDelegateValue,
            blue: blueColorDelegateValue,
            alpha: 1
        )
    }
}
