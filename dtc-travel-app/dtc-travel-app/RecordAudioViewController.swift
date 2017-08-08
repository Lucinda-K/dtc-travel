//
//  RecordAudioViewController.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 8/7/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class RecordAudioViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var audioImage: UIImageView!
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let buttonText = (self.button.titleLabel?.text)?.lowercased() {
            switch buttonText {
            case "record":
                self.button.setTitle("Stop", for: .normal)
                self.audioImage.isHidden = false
            case "stop":
                self.button.setTitle("Submit", for: .normal)
                self.audioImage.isHidden = true
            case "submit":
                self.dismiss(animated: true, completion: nil)
                break
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
