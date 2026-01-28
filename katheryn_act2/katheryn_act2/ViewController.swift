//
//  ViewController.swift
//  katheryn_act2
//
//  Created by Alumno on 27/01/26.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var opacitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuración inicial de la imagen
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = false

        // Configuración del slider de edad
        ageSlider.minimumValue = 0
        ageSlider.maximumValue = 100
        ageSlider.value = 25
        ageLabel.text = "Edad: 25"

        // Configuración del slider de opacidad
        opacitySlider.minimumValue = 0
        opacitySlider.maximumValue = 1
        opacitySlider.value = 1
        imageView.alpha = 1
    }
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        view.backgroundColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
    }
    
    @IBAction func toggleImageVisibility(_ sender: UIButton) {
        imageView.isHidden.toggle()
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @IBAction func ageSliderChanged(_ sender: UISlider) {
        let age = Int(sender.value)
        ageLabel.text = "Edad: \(age)"
    }
    
    @IBAction func opacitySliderChanged(_ sender: UISlider) {
        imageView.alpha = CGFloat(sender.value)
    }
    
    func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let selectedImage = info[.originalImage] as? UIImage {
                imageView.image = selectedImage
            }
            dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true)
        }
}
