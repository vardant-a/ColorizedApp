//
//  SettingColorViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 11.07.2022.
//

import UIKit

class SettingColorViewController: UIViewController {
    
    // MARK: IB outlets
    
    @IBOutlet var rgbColorView: UIView!

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public properties
    
    var colorVC: UIColor!
    var delegate: SettingViewControllerDelegate!
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbColorView.backgroundColor = colorVC
        
        getDefaultRGBcolor()
        keyboardToolbar()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - IB Actions
    
    @IBAction func generateColor(_ sender: UISlider) {
        switch sender {
        case redSlider:
            updateDateColors(to: redLabel)
        case greenSlider:
            updateDateColors(to: greenLabel)
        default:
            updateDateColors(to: blueLabel)
        }
        
        setColorView()
    }
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped() {
        colorVC = rgbColorView.backgroundColor
        delegate?.сolorUpdateView(from: colorVC)
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension SettingColorViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let dateTextField = textField.text else { return }
        guard let valueTF = Float(dateTextField) else { return }
        
        switch textField {
        case redTextField:
            redSlider.value = valueTF
        case greenTextField:
            greenSlider.value = valueTF
        default:
            blueSlider.value = valueTF
        }
        
        setColorView()
        updateDateColors(to: redLabel, greenLabel, blueLabel)
    }
}

// MARK: - Private Methods

extension SettingColorViewController {
    
    private func getDefaultRGBcolor() {
        var red: CGFloat = 1
        var green: CGFloat = 1
        var blue: CGFloat = 1
        var alpha: CGFloat = 1
        
        colorVC.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        )
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        updateDateColors(to: redLabel, greenLabel, blueLabel)
    }
    
    private func updateDateColors(to labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = stringFrom(redSlider)
                redTextField.text = redLabel.text
            case greenLabel:
                greenLabel.text = stringFrom(greenSlider)
                greenTextField.text = greenLabel.text
            default:
                blueLabel.text = stringFrom(blueSlider)
                blueTextField.text = blueLabel.text
            }
        }
    }
    
    private func stringFrom(_ slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setColorView() {
        rgbColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(1)
        )
    }
    
    private func keyboardToolbar() {
        // Реализация данного кода под чистую взято из гугла.
        let toolbar = UIToolbar()
        let emptySpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        let buttonDone = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(butDonePressed)
        )
        
        toolbar.barStyle = .default
        toolbar.items = [emptySpace, buttonDone]
        toolbar.sizeToFit()
        
        redTextField.inputAccessoryView = toolbar
        greenTextField.inputAccessoryView = toolbar
        blueTextField.inputAccessoryView = toolbar
    }
    
    @objc private func butDonePressed() {
        view.endEditing(true)
    }
}
