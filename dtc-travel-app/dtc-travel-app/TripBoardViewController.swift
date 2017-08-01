//
//  TripBoardViewController.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 7/30/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class TripBoardViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEntryButton: UIButton!
    
    // IBActions
    @IBAction func addTapped(_ sender: Any) {
        self.presentEntryOptionsPopover()
    }
    
    // Class attributes
    final fileprivate let reuseId = "categoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: reuseId)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentCameraEntry" {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // Popover Functionality
    private func presentEntryOptionsPopover () {
        guard let entryOptionsPopover = self.storyboard?.instantiateViewController(withIdentifier: "entryOptionsPopover") as? UITableViewController else {
            preconditionFailure("EntryOptionsPopover cannot be instantiated from storyboard")
        }
        
        let navigationController = UINavigationController(rootViewController: entryOptionsPopover)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.popover
        navigationController.isNavigationBarHidden = true
        entryOptionsPopover.preferredContentSize = CGSize(width: 300, height: 150)
        
        guard let popover = navigationController.popoverPresentationController else {
            preconditionFailure("Unable to access popoverPresentationControlller for presentation of EntryOptionsPopover")
        }
        popover.delegate = self
        popover.sourceView = self.addEntryButton
        popover.sourceRect = self.addEntryButton.bounds
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}

extension TripBoardViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "FOOD"
        case 1:
            return "PEOPLE"
        case 2:
            return "BUILDINGS"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? CategoryTableViewCell else {
            preconditionFailure("Cell cannot be dequeued as a CategoryTableViewCell")
        }
        return cell
    } 
}
