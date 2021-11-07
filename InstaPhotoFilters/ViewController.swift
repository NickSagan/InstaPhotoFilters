//
//  ViewController.swift
//  InstaPhotoFilters
//
//  Created by Nick Sagan on 07.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var currentImage = UIImage!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
    }
    
    @IBAction func changeFilter(_ sender: UIButton) {
    }
    @IBAction func save(_ sender: UIButton) {
    }
}

