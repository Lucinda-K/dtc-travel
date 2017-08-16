//
//  TextEntryViewController.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 8/7/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class TextEntryViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var titleInputField: UITextField!
    @IBOutlet weak var textEntryField: UITextView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBAction func postTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    final private let categories = ["Food", "People", "Buildings"]
    private let prompt = "Prompt: Describe what you can hear in this moment."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textEntryField.delegate = self
        self.titleInputField.delegate = self
        self.categoryPickerView.dataSource = self
        self.categoryPickerView.delegate = self
        
        textEntryField.text = prompt
        textEntryField.textColor = UIColor.lightGray
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string == "\n") {
            textField.resignFirstResponder()
            return false
        }
        return true
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = prompt
            textView.textColor = UIColor.lightGray
        }
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
