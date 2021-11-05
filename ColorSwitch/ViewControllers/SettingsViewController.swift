//
//  ViewController.swift
//  ColorSwitch
//
//  Created by Алексей Парфенов on 23.10.2021.
//

import UIKit


class SettingsViewController: UIViewController {


    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSLider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueslider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var blueValueTF: UITextField!
    
    
    
    var bgColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        redSLider.tintColor = .red
        greenSlider.tintColor = .green
        
        redSLider.value = 0.25
        greenSlider.value = 0.5
        blueslider.value = 0.75
        
        redSLider.thumbTintColor = .purple
        greenSlider.thumbTintColor = .purple
        blueslider.thumbTintColor = .purple
        
        
        colorChange()
    }

    func colorChange() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSLider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueslider.value), alpha: 1)
    }
    
    @IBAction func grbChangeColor(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = String(format: "%.2f", sender.value)
            redValueTF.text = redLabel.text
        case 1:
            greenLabel.text = String(format: "%.2f", sender.value)
            greenValueTF.text = greenLabel.text
        case 2:
            blueLabel.text = String(format: "%.2f", sender.value)
            blueValueTF.text = blueLabel.text
        default: break
        }
        colorChange()
    }
    
    @IBAction func doneButtomPressed() {
        delegate.changeViewColor(_color: UIColor(
            red: CGFloat(redSLider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueslider.value), alpha: 1))
        dismiss(animated: true)
    }
}
