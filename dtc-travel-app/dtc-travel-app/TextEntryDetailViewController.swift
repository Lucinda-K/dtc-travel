//
//  TextEntryDetailViewController.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 8/14/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class TextEntryDetailViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var textEntry: UITextView!
    
    // IBActions
    @IBAction func doneTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private var delegate:UIViewController?
    private var entryModel:Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configure (entryModel:Entry, delegate:UIViewController) {
        self.entryModel = entryModel
        self.delegate = delegate
        
        self.titleLabel.text = entryModel.title ?? ""
        self.categoryLabel.text = entryModel.category
        self.textEntry.text = entryModel.textEntry ?? ""
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
