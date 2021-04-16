//
//  ViewController.swift
//  coredata+saveimage1
//
//  Created by Shaik abdul mazeed on 16/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saveImage: UIImageView!
    
    @IBOutlet weak var getImage: UIImageView!
    
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        saveImage.isUserInteractionEnabled = true
        saveImage.addGestureRecognizer(tap)
    }
    @objc func tapAction(){
        
        loadImage()
        
    }
    @IBAction func saveImageAction(_ sender: UIButton) {
        if let png = saveImage.image?.pngData(){
            Database.shared.insertData(mydata: png)
        }
    }
    
    
    @IBAction func getImageAction(_ sender: UIButton) {
        
        let img = Database.shared.getImage()
        getImage.image = UIImage(data: img[1].myimage!)
    }
    
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func loadImage(){
        
        if (UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)){
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .savedPhotosAlbum
            present(imagePicker, animated: true, completion: nil)
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        
        if let img = info[.originalImage] as? UIImage{
            saveImage.image = img
        }
    }
    
}
