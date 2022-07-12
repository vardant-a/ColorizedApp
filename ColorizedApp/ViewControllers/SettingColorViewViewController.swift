//
//  SettingColorViewViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 11.07.2022.
//

import UIKit

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
    
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbColorView.backgroundColor = color
        
        
    }
    
    @IBAction func setColorComponent(_ sender: UISlider) {
        setColorView()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
}

// MARK: -

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
}
