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
        setValueForLabels(for: redLabel, greenLabel, blueLabel)
        setValueForTextFields(for: redValueTF, greenValueTF, blueValueTF)
        
    }

    func colorChange() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSLider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueslider.value), alpha: 1)
    }
    
    private func setValueForLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = String(format: "%.2f", redSLider.value)
            case greenLabel:
                greenLabel.text = String(format: "%.2f", greenSlider.value)
            default:
                blueLabel.text = String(format: "%.2f", blueslider.value)
            }
        }
    }
    
    private func setValueForTextFields(for textfields: UITextField...) {
        textfields.forEach { textfield in
            switch textfield {
            case redValueTF:
                redValueTF.text = String(format: "%.2f", redSLider.value)
            case greenValueTF:
                greenValueTF.text = String(format: "%.2f", greenSlider.value)
            default:
                blueValueTF.text = String(format: "%.2f", blueslider.value)
                
            }
            
        }
    }
    
    @IBAction func grbChangeColor(_ sender: UISlider) {
        switch sender {
        case redSLider:
            redLabel.text = String(format: "%.2f", redSLider.value)
            redValueTF.text = redLabel.text
        case greenSlider:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenValueTF.text = greenLabel.text
        case blueslider:
            blueLabel.text = String(format: "%.2f", blueslider.value)
            blueValueTF.text = blueLabel.text
        default: break
        }
        colorChange()
    }
    
    @IBAction func doneButtomPressed() {
        view.endEditing(true)
        delegate.changeViewColor(_color: UIColor(
            red: CGFloat(redSLider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueslider.value), alpha: 1))
        dismiss(animated: true)
    }
}
