//
//  CaptionMediaViewController.swift
//  dtc-travel-app
//
//  Created by Lucinda Krahl on 8/7/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class CaptionMediaViewController: UIViewController {
    
    @IBOutlet weak var CapturedImageView: UIImageView!
    @IBOutlet weak var DescriptionTextView: UITextView!
    
    var capturedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CapturedImageView.image = capturedImage
        
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
