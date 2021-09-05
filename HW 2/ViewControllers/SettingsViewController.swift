//
//  ViewController.swift
//  HW 2
//
//  Created by Alexey Efimov on 12.06.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var redSliderValueContainer: Float!
    var greenSliderValueContainer: Float!
    var blueSliderValueContainer: Float!
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = redSliderValueContainer
        greenSlider.value = greenSliderValueContainer
        blueSlider.value = blueSliderValueContainer
        
        addDoneButton(in: redTextField)
        addDoneButton(in: greenTextField)
        addDoneButton(in: blueTextField)
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func saveButtonPressed() {
        delegate.setBackgroundColor(
            redColorDelegateValue: CGFloat(redSlider.value),
            greenColorDelegateValue: CGFloat(greenSlider.value),
            blueColorDelegateValue: CGFloat(blueSlider.value)
        )
        
        self.dismiss(animated: true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
                redTextField.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
                greenTextField.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redTextField {
            redLabel.text = redTextField.text
            redSlider.value = Float(redTextField.text ?? "") ?? 0.0
        } else if textField == greenTextField {
            greenLabel.text = greenTextField.text
            greenSlider.value = Float(greenTextField.text ?? "") ?? 0.0
        } else {
            blueLabel.text = blueTextField.text
            blueSlider.value = Float(blueTextField.text ?? "") ?? 0.0
        }
        
        setColor()
        return true
    }
}

extension SettingsViewController {
    private func addDoneButton(in texField: UITextField) {
        let keyboardToolbar = UIToolbar(frame: CGRect(
                                            x: 0,
                                            y: 0,
                                            width: UIScreen.main.bounds.width,
                                            height: 44))
        
        keyboardToolbar.sizeToFit()
        keyboardToolbar.barStyle = .default
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let doneBarButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(endEdit(sender: ))
        )
        
        doneBarButton.tag = texField.tag
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        texField.inputAccessoryView = keyboardToolbar
    }
    
    @objc private func endEdit(sender: UITextField!) {
        if sender.tag == 0 {
            redLabel.text = redTextField.text
            redSlider.value = Float(redTextField.text ?? "") ?? 0.0
            redTextField.endEditing(true)
        } else if sender.tag == 1 {
            greenLabel.text = greenTextField.text
            greenSlider.value = Float(greenTextField.text ?? "") ?? 0.0
            greenTextField.endEditing(true)
        } else {
            blueLabel.text = blueTextField.text
            blueSlider.value = Float(blueTextField.text ?? "") ?? 0.0
            blueTextField.endEditing(true)
        }
        
        setColor()
    }
}
