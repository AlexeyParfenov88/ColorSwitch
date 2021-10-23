//
//  ViewController.swift
//  ColorSwitch
//
//  Created by Алексей Парфенов on 23.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSLider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueslider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        redSLider.tintColor = .red
        greenSlider.tintColor = .green
        
        redSLider.minimumValue = 0.0
        redSLider.maximumValue = 1.0
        redSLider.value = 0.0
        
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        greenSlider.value = 0.0
        
        blueslider.minimumValue = 0.0
        blueslider.maximumValue = 1.0
        blueslider.value = 0.0
        
    }

    func colorChange() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSLider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueslider.value), alpha: 1)
    }
    
    @IBAction func grbChangeColor(_ sender: Any) {
        colorChange()
    }
    

}

