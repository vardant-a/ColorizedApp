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

    @IBOutlet var redLabels: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var redTextField: UITextField!
    
    @IBOutlet var greenLabels: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenTextField: UITextField!
    
    @IBOutlet var blueLabels: UILabel!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueTextField: UITextField!
    
    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setColorComponent(_ sender: UISlider) {
        setColorView()
        redLabels.text = String(format: "%.2f", redSlider.value)
        greenLabels.text = String(format: "%.2f", greenSlider.value)
        blueLabels.text = String(format: "%.2f", blueSlider.value)
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
}
