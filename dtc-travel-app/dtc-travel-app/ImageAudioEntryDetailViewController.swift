//
//  ImageAudioEntryDetailViewController.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 8/14/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class ImageAudioEntryDetailViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // IBActions
    @IBAction func doneTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configure (entry:Entry) {
        self.imageView.image = UIImage(named: entry.imageString ?? "")
        self.captionLabel.text = entry.title ?? ""
        self.categoryLabel.text = entry.category
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
