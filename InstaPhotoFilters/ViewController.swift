//
//  ViewController.swift
//  InstaPhotoFilters
//
//  Created by Nick Sagan on 07.11.2021.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentImage: UIImage!
    var context: CIContext!
    var currentFilter: CIFilter!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "InstaFilters"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        dismiss(animated: true)
        currentImage = image
        
        let filterImage = CIImage(image: currentImage)
        currentFilter.setValue(filterImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    @objc func addPhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func applyProcessing() {
        currentFilter.setValue(slider.value, forKey: kCIInputIntensityKey)
        
        if let cgImage = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgImage)
            imageView.image = processedImage
        }
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        applyProcessing()
    }
    
    @IBAction func changeFilter(_ sender: UIButton) {
        
    }
    @IBAction func save(_ sender: UIButton) {
    }
}

