//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 11.07.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func сolorUpdateView(from color: UIColor)
}

class ColorViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingVC = navigationVC.topViewController as? SettingColorViewController else { return }
        settingVC.delegate = self
        settingVC.colorView = view.backgroundColor
    }
}

// MARK: - SettingViewControllerDelegate

extension ColorViewController: SettingViewControllerDelegate {
    func сolorUpdateView(from color: UIColor) {
        view.backgroundColor = color
    }
}
