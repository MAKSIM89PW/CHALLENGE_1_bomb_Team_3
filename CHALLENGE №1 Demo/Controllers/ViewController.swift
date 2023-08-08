//
//  ViewController.swift
//  CHALLENGE №1 Demo
//
//  Created by Vanopr on 07.08.2023.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        
        
    }
    
}
