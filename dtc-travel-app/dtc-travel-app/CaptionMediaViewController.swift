//
//  CaptionMediaViewController.swift
//  dtc-travel-app
//
//  Created by Lucinda Krahl on 8/7/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class CaptionMediaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var CapturedImageView: UIImageView!
    @IBOutlet weak var DescriptionTextView: UITextView!
    
    
    @IBAction func skipTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var capturedImage: UIImage!
    var categories: [String] = [String]()
    
    @IBAction func submitCaption(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CapturedImageView.image = capturedImage
        categories = ["FOOD", "BUILDINDS", "PEOPLE"]
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(CaptionMediaViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CaptionMediaViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
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
