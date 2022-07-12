//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 11.07.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    var color = UIColor(
        red: CGFloat(1.0),
        green: CGFloat(1.0),
        blue: CGFloat(1.0),
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingVC = navigationVC as? SettingColorViewViewController else { return }
        settingVC.color = color
    }
}
