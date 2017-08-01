//
//  CameraViewController.swift
//  dtc-travel-app
//
//  Created by Lucinda Krahl on 7/25/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {


    @IBOutlet weak var previewView: UIView!
    
    @IBOutlet weak var takeAPictureButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestures()
    }
    
    func addTapGestures() {
        let tapToTakePhoto = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        takeAPictureButton.addGestureRecognizer(tapToTakePhoto)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func tappedImage(_ sender: UITapGestureRecognizer) {
        // Make sure device has a camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        // Setup and present default Camera View Controller
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Dismiss the view controller a
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
    
}






