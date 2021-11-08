//
//  StartViewController.swift
//  ColorSwitch
//
//  Created by Алексей Парфенов on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func changeViewColor(_ color: UIColor)
}

class StartViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.bgColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func changeViewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
