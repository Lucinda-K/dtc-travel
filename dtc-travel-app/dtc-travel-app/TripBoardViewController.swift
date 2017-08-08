//
//  TripBoardViewController.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 7/30/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit
import MobileCoreServices

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
    final fileprivate let foodImages = ["food1.jpg", "speaker.png", "writing3.png", "food2.jpg", "food3.jpeg"]
    final fileprivate let peopleImages = ["speaker.png", "people1.jpg", "people2.png", "speaker.png", "writing1.png"]
    final fileprivate let buildingImages = ["writing1.png", "speaker.png", "writing2.png"]
    private var entryPopover:EntryOptionsPopoverViewController?
    
    var capturedImage: UIImage?
    
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
        if segue.identifier == "usePhoto" {
            let destination = segue.destination as! CaptionMediaViewController
            destination.capturedImage = self.capturedImage
        }
    }
    
    // Popover Functionality
    private func presentEntryOptionsPopover () {
        guard let entryOptionsPopover = self.storyboard?.instantiateViewController(withIdentifier: "entryOptionsPopover") as? EntryOptionsPopoverViewController else {
            preconditionFailure("EntryOptionsPopover cannot be instantiated from storyboard")
        }
        
        self.entryPopover = entryOptionsPopover
        entryOptionsPopover.delegate = self
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
    
    func presentCamera () {
        self.entryPopover?.dismiss(animated: false, completion: {
            self.showCamera()
        })
    }
    
    // Use photo from image picker
    func captionCapturedImage(capturedImage: UIImage) {
        self.capturedImage = capturedImage;
        
    }
    
    func presentCaptionView(capturedImage: UIImage) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "captionView") as? CaptionMediaViewController {
            controller.capturedImage = capturedImage
            self.dismiss(animated: true, completion: nil)
            self.present(controller, animated: true, completion: nil)
        }
    }
}

extension TripBoardViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rect = self.tableView.bounds
        
        var numCells = CGFloat(0)
        switch indexPath.section {
        case 0:
            numCells = CGFloat(self.foodImages.count)
        case 1:
            numCells = CGFloat(self.peopleImages.count)
        case 2:
            numCells = CGFloat(self.buildingImages.count)
        default:
            break
        }
        
        let numOfRows = (numCells * 100 / rect.width).rounded()
        print("numOfRows = (\(numCells) * 100 / \(rect.width)).rounded()")
        return (numCells / 4.0).rounded() * 100
//        return CGFloat(numOfRows * 100)
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
        
        switch indexPath.section {
        case 0:
            cell.configure(images: self.foodImages)
        case 1:
            cell.configure(images: self.peopleImages)
        case 2:
            cell.configure(images: self.buildingImages)
        default:
            break
        }
        return cell
    } 
}

extension TripBoardViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showCamera() {
        // Make sure device has a camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // Setup and present default Camera View Controller
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
        
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Dismiss the view controller a
        picker.dismiss(animated: true, completion: nil)
        
        // Get the picture we took
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.presentCaptionView(capturedImage: image)
    }
}

// Entry Creation
extension TripBoardViewController {
    func presentAudio() {
        let storyboard = UIStoryboard(name: "AudioEntry", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "audioEntry") as? RecordAudioViewController {
            self.dismiss(animated: true, completion: nil)
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func presentText() {
        let storyboard = UIStoryboard(name: "TextEntry", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "textEntry")
        self.dismiss(animated: true, completion: nil)
        self.present(controller, animated: true, completion: nil)
    }
}
