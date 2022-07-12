//
//  SettingColorViewViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 11.07.2022.
//

import UIKit

protocol UITextFieldDelegate {
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//    }
}

class SettingColorViewViewController: UIViewController {
    
    // MARK: IB outlets
    
    @IBOutlet var rgbColorView: UIView!

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var redTextField: UITextField!
    
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenTextField: UITextField!
    
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public properties
    
    var color: UIColor!
    var delegate: SettingViewControllerDelegate!
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        defaultSettingColor()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - IB Actions
    
    @IBAction func setColorComponent(_ sender: UISlider) {
        setColorView()
        
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

    @IBAction func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped() {
//        delegate.
        dismiss(animated: true)
    }
}

// MARK: - Private Methods

extension SettingColorViewViewController {
    
    private func setColorView() {
        rgbColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func defaultSettingColor() {
        rgbColorView.backgroundColor = color
        
    }
}

// MARK: - UITextFieldDelegate

extension SettingColorViewViewController: UITextFieldDelegate {
    
    
}
